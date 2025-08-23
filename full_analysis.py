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
    '3648b_dat': 24, # Gear 24 Tooth  
    '3649_dat': 16,  # Gear 16 Tooth
    '32270_dat': 12, # Gear 12 Tooth Double Bevel
    '6589_dat': 12,  # Gear 12 Tooth Bevel
    '6573_dat': 24,  # Differential Gear Case
}

# Find all nodes
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

# Extract all gears with positions
gears = []
gear_id = 0

for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    material_elem = node.find('.//collada:instance_material', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        matrix_text = matrix_elem.text.strip().split()
        matrix = [float(x) for x in matrix_text]
        
        # Position is at indices 3, 7, 11
        position = [matrix[3], matrix[7], matrix[11]]
        
        # Get geometry type
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        # Get material
        material = ''
        if material_elem is not None:
            material = material_elem.get('target', '').replace('#', '')
        
        teeth = gear_teeth.get(geom_url, 0)
        if teeth > 0:
            gear_info = {
                'id': gear_id,
                'type': geom_url,
                'position': position,
                'teeth': teeth,
                'material': material
            }
            gears.append(gear_info)
            gear_id += 1
            
            # Mark special gears
            if 'Red' in material:
                print(f"RED GEAR: {geom_url} at {position}")
            elif 'Blue' in material:
                print(f"BLUE GEAR: {geom_url} at {position}")

print(f"\nTotal gears: {len(gears)}")

# Build connectivity graph
def distance(pos1, pos2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(pos1, pos2)))

# Find connections
connections = []
for i, g1 in enumerate(gears):
    for j, g2 in enumerate(gears):
        if i >= j:
            continue
        
        # Check if on same Z level (within tolerance)
        z_diff = abs(g1['position'][2] - g2['position'][2])
        xy_dist = distance(g1['position'][:2], g2['position'][:2])
        
        # Gears mesh if close in XY and same Z
        if z_diff < 2 and 15 < xy_dist < 25:
            ratio = g2['teeth'] / g1['teeth']
            connections.append((g1['id'], g2['id'], ratio))
            print(f"Connection: Gear{g1['id']}({g1['teeth']}t) -> Gear{g2['id']}({g2['teeth']}t), ratio={ratio:.3f}, dist={xy_dist:.1f}")

# Build graph
graph = defaultdict(list)
for g1_id, g2_id, ratio in connections:
    graph[g1_id].append((g2_id, ratio))
    graph[g2_id].append((g1_id, 1/ratio))

# Find connected components
def find_components():
    visited = set()
    components = []
    
    for gear in gears:
        if gear['id'] not in visited:
            component = []
            queue = deque([gear['id']])
            
            while queue:
                current = queue.popleft()
                if current in visited:
                    continue
                visited.add(current)
                component.append(current)
                
                for neighbor, _ in graph[current]:
                    if neighbor not in visited:
                        queue.append(neighbor)
            
            components.append(component)
    
    return components

components = find_components()
print(f"\n=== CONNECTED COMPONENTS ===")
print(f"Found {len(components)} separate gear systems:")
for i, comp in enumerate(components):
    print(f"\nComponent {i+1}: {len(comp)} gears")
    if len(comp) <= 10:
        for gear_id in comp:
            gear = gears[gear_id]
            print(f"  Gear{gear_id}: {gear['type']}({gear['teeth']}t) at ({gear['position'][0]:.1f}, {gear['position'][1]:.1f}, {gear['position'][2]:.1f})")

# Find the largest component
largest = max(components, key=len)
print(f"\nLargest component has {len(largest)} gears")

# Try to trace a path through the largest component
if len(largest) > 1:
    start = largest[0]
    end = largest[-1]
    
    # BFS to find path
    queue = deque([(start, 1.0, [start])])
    visited = {start}
    
    while queue:
        current, ratio, path = queue.popleft()
        
        if current == end:
            print(f"\nPath from Gear{start} to Gear{end}:")
            print(f"Total ratio: {ratio:.6f}")
            for p in path:
                g = gears[p]
                print(f"  Gear{p}: {g['teeth']}t")
            break
        
        for neighbor, edge_ratio in graph[current]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, ratio * edge_ratio, path + [neighbor]))

# Check for patterns in positions
print("\n=== POSITION PATTERNS ===")
x_coords = sorted(set(round(g['position'][0]) for g in gears))
y_coords = sorted(set(round(g['position'][1]) for g in gears))
z_coords = sorted(set(round(g['position'][2], 1) for g in gears))

print(f"X coordinates ({len(x_coords)} unique): {x_coords[:10]}...")
print(f"Y coordinates ({len(y_coords)} unique): {y_coords[:10]}...")
print(f"Z coordinates ({len(z_coords)} unique): {z_coords}")