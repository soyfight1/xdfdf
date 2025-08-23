#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from collections import defaultdict
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
    '3650a_dat': 24, # Gear 24 Tooth Crown
    '3650b_dat': 24, # Gear 24 Tooth Crown
    '3650c_dat': 24, # Gear 24 Tooth Crown
    '32269_dat': 20, # Gear 20 Tooth Double Bevel
    '32270_dat': 12, # Gear 12 Tooth Double Bevel
    '6542a_dat': 16, # Gear 16 Tooth with Round Holes
    '6542b_dat': 16, # Gear 16 Tooth with Round Holes
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
        
        gears.append(gear_info)
        
        # Identify red and blue axles
        if geom_url == '32073_dat':
            if 'Red-material' in material:
                red_axle = gear_info
                print(f"RED AXLE found at position: {position}")
            elif 'Blue-material' in material:
                blue_axle = gear_info
                print(f"BLUE AXLE found at position: {position}")

print(f"\nTotal pieces found: {len(gears)}")
print(f"Gear types count:")
gear_count = defaultdict(int)
for g in gears:
    gear_count[g['type']] += 1
for gtype, count in sorted(gear_count.items()):
    teeth = gear_teeth.get(gtype, 0)
    print(f"  {gtype}: {count} pieces ({teeth} teeth)")

# Function to calculate distance between two positions
def distance(pos1, pos2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(pos1, pos2)))

# Find gears near the red and blue axles
def find_nearby_gears(axle, gears, max_dist=30):
    nearby = []
    for gear in gears:
        if gear['teeth'] > 0:  # Only consider actual gears
            dist = distance(axle['position'], gear['position'])
            if dist < max_dist and dist > 0:
                nearby.append((gear, dist))
    return sorted(nearby, key=lambda x: x[1])

if red_axle and blue_axle:
    print(f"\n=== RED AXLE ANALYSIS ===")
    print(f"Position: {red_axle['position']}")
    red_nearby = find_nearby_gears(red_axle, gears)
    print(f"Nearby gears:")
    for gear, dist in red_nearby[:5]:
        print(f"  {gear['type']} ({gear['teeth']} teeth) at distance {dist:.2f}, pos: {gear['position']}")
    
    print(f"\n=== BLUE AXLE ANALYSIS ===")
    print(f"Position: {blue_axle['position']}")
    blue_nearby = find_nearby_gears(blue_axle, gears)
    print(f"Nearby gears:")
    for gear, dist in blue_nearby[:5]:
        print(f"  {gear['type']} ({gear['teeth']} teeth) at distance {dist:.2f}, pos: {gear['position']}")

# Find all gears and group by similar Z coordinates (same level)
print("\n=== GEARS BY Z-LEVEL ===")
z_levels = defaultdict(list)
for gear in gears:
    if gear['teeth'] > 0:
        z = round(gear['position'][2], 1)
        z_levels[z].append(gear)

for z in sorted(z_levels.keys()):
    print(f"\nZ-level {z}:")
    for gear in z_levels[z]:
        print(f"  {gear['type']} ({gear['teeth']} teeth) at ({gear['position'][0]:.1f}, {gear['position'][1]:.1f})")

# Try to trace connections
print("\n=== SEARCHING FOR GEAR CONNECTIONS ===")
# Two gears mesh if they are close enough and on same Z level
def find_connections(gears, max_dist=25):
    connections = []
    for i, g1 in enumerate(gears):
        if g1['teeth'] == 0:
            continue
        for j, g2 in enumerate(gears):
            if i >= j or g2['teeth'] == 0:
                continue
            # Check if on similar Z level
            if abs(g1['position'][2] - g2['position'][2]) < 5:
                dist = distance(g1['position'], g2['position'])
                if dist < max_dist:
                    connections.append((g1, g2, dist))
    return connections

connections = find_connections(gears)
print(f"Found {len(connections)} potential gear connections")
for g1, g2, dist in sorted(connections, key=lambda x: x[2])[:20]:
    print(f"  {g1['type']}({g1['teeth']}t) @ {g1['position'][0]:.1f},{g1['position'][1]:.1f},{g1['position'][2]:.1f} <-> {g2['type']}({g2['teeth']}t) @ {g2['position'][0]:.1f},{g2['position'][1]:.1f},{g2['position'][2]:.1f} (dist: {dist:.2f})")