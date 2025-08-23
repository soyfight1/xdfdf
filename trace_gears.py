#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from collections import defaultdict, deque
import math

# Parse the COLLADA file
tree = ET.parse('VirtualMachine1.dae')
root = tree.getroot()

# Namespace
ns = {'collada': 'http://www.collada.org/2005/11/COLLADASchema'}

# Known LEGO gear teeth counts
gear_teeth = {
    '3647_dat': 8,   # Gear 8 Tooth
    '3648b_dat': 24, # Gear 24 Tooth with Single Axle Hole
    '3649_dat': 16,  # Gear 16 Tooth
    '32270_dat': 12, # Gear 12 Tooth Double Bevel
    '6589_dat': 12,  # Gear 12 Tooth Bevel
    '6573_dat': 24,  # Differential Gear Case (contains gears)
    '32073_dat': 0,  # Axle (not a gear)
    '4019_dat': 0,   # Axle (not a gear)
    '44294_dat': 0,  # Axle connector
}

# Find all nodes in visual_scene
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

# Extract gear positions and types
gears = []
axles = []
red_axle = None
blue_axle = None

for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    material_elem = node.find('.//collada:instance_material', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        matrix_text = matrix_elem.text.strip().split()
        matrix = [float(x) for x in matrix_text]
        
        # Extract position (translation part of matrix) - indices 3, 7, 11
        position = [matrix[3], matrix[7], matrix[11]]
        
        # Get geometry type
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        # Get material if exists
        material = ''
        if material_elem is not None:
            material = material_elem.get('target', '').replace('#', '')
        
        gear_info = {
            'type': geom_url,
            'position': position,
            'matrix': matrix,
            'material': material,
            'teeth': gear_teeth.get(geom_url, 0)
        }
        
        if gear_info['teeth'] > 0:
            gears.append(gear_info)
        elif geom_url in ['32073_dat', '4019_dat', '44294_dat']:
            axles.append(gear_info)
        
        # Identify red and blue axles
        if geom_url == '32073_dat':
            if 'Red-material' in material:
                red_axle = gear_info
                print(f"RED AXLE found at position: {position}")
            elif 'Blue-material' in material:
                blue_axle = gear_info
                print(f"BLUE AXLE found at position: {position}")

# Function to calculate distance between two positions
def distance(pos1, pos2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(pos1, pos2)))

# Find all axles and their connected gears
print(f"\n=== AXLE ANALYSIS ===")
print(f"Total axles/connectors: {len(axles)}")

# Find gears that share the same axle (very close in X,Y but different Z)
def find_gears_on_same_axle(gears, tolerance=5):
    axle_groups = []
    used = set()
    
    for i, g1 in enumerate(gears):
        if i in used:
            continue
        group = [g1]
        used.add(i)
        
        for j, g2 in enumerate(gears):
            if j in used or i == j:
                continue
            # Check if on same vertical line (same X,Y but different Z)
            if (abs(g1['position'][0] - g2['position'][0]) < tolerance and
                abs(g1['position'][1] - g2['position'][1]) < tolerance):
                group.append(g2)
                used.add(j)
        
        if len(group) > 1:
            axle_groups.append(group)
    
    return axle_groups

axle_groups = find_gears_on_same_axle(gears)
print(f"\nFound {len(axle_groups)} axle groups (gears on same axle):")
for group in axle_groups:
    print(f"  Axle at X={group[0]['position'][0]:.1f}, Y={group[0]['position'][1]:.1f}:")
    for g in group:
        print(f"    {g['type']} ({g['teeth']} teeth) at Z={g['position'][2]:.1f}")

# Find gear connections (meshing gears)
def find_meshing_gears(gears):
    connections = []
    for i, g1 in enumerate(gears):
        for j, g2 in enumerate(gears):
            if i >= j:
                continue
            # Gears mesh if they're on similar Z level and close enough
            if abs(g1['position'][2] - g2['position'][2]) < 2:
                dist = distance(g1['position'][:2], g2['position'][:2])
                # Typical meshing distance for LEGO gears
                if 15 < dist < 25:
                    connections.append((g1, g2, dist))
    return connections

connections = find_meshing_gears(gears)
print(f"\n=== GEAR MESH CONNECTIONS ===")
print(f"Found {len(connections)} meshing gear pairs:")
for g1, g2, dist in sorted(connections, key=lambda x: x[2]):
    ratio = g2['teeth'] / g1['teeth'] if g1['teeth'] > 0 else 0
    print(f"  {g1['type']}({g1['teeth']}t) @ ({g1['position'][0]:.1f},{g1['position'][1]:.1f},{g1['position'][2]:.1f}) <-> {g2['type']}({g2['teeth']}t) @ ({g2['position'][0]:.1f},{g2['position'][1]:.1f},{g2['position'][2]:.1f}) | Ratio: {ratio:.3f}")

# Build gear graph
gear_graph = defaultdict(list)
for g1, g2, dist in connections:
    key1 = tuple(g1['position'])
    key2 = tuple(g2['position'])
    gear_graph[key1].append((key2, g2['teeth'] / g1['teeth'] if g1['teeth'] > 0 else 1))
    gear_graph[key2].append((key1, g1['teeth'] / g2['teeth'] if g2['teeth'] > 0 else 1))

# Also connect gears on same axle (they rotate together with ratio 1:1)
for group in axle_groups:
    for i in range(len(group)):
        for j in range(i+1, len(group)):
            key1 = tuple(group[i]['position'])
            key2 = tuple(group[j]['position'])
            gear_graph[key1].append((key2, 1.0))
            gear_graph[key2].append((key1, 1.0))

print(f"\n=== SEARCHING PATH FROM RED TO BLUE ===")

# Find closest gears to red and blue axles
def find_closest_gear(axle_pos, gears):
    min_dist = float('inf')
    closest = None
    for g in gears:
        dist = distance(axle_pos, g['position'])
        if dist < min_dist:
            min_dist = dist
            closest = g
    return closest, min_dist

if red_axle and blue_axle:
    red_closest, red_dist = find_closest_gear(red_axle['position'], gears)
    blue_closest, blue_dist = find_closest_gear(blue_axle['position'], gears)
    
    print(f"Red axle closest gear: {red_closest['type']} at distance {red_dist:.2f}")
    print(f"Blue axle closest gear: {blue_closest['type']} at distance {blue_dist:.2f}")
    
    # Try to find path using BFS
    start = tuple(red_closest['position'])
    end = tuple(blue_closest['position'])
    
    queue = deque([(start, 1.0, [start])])
    visited = {start}
    
    path_found = False
    while queue and not path_found:
        current, ratio, path = queue.popleft()
        
        if current == end:
            print(f"\nPATH FOUND!")
            print(f"Total ratio: {ratio:.6f}")
            print("Path:")
            for p in path:
                for g in gears:
                    if tuple(g['position']) == p:
                        print(f"  {g['type']} ({g['teeth']}t) at {p}")
                        break
            path_found = True
            break
        
        for neighbor, edge_ratio in gear_graph[current]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, ratio * edge_ratio, path + [neighbor]))
    
    if not path_found:
        print("\nNo direct path found. Gears might not be fully connected.")
        print(f"Visited {len(visited)} gears out of {len(gears)} total.")