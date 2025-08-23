#!/usr/bin/env python3
"""
Try to find the actual gear path by analyzing connected components more carefully.
Maybe there's a specific path we need to follow.
"""

import xml.etree.ElementTree as ET
from collections import defaultdict, deque
import math

# Parse file
tree = ET.parse('VirtualMachine1.dae')
root = tree.getroot()
ns = {'collada': 'http://www.collada.org/2005/11/COLLADASchema'}

# Gear teeth
gear_teeth = {
    '3647_dat': 8,
    '3648b_dat': 24,
    '3649_dat': 16,
    '32270_dat': 12,
    '6589_dat': 12,
    '6573_dat': 24,
}

# Extract all pieces
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

all_gears = []
red_pos = None
blue_pos = None

for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    material_elem = node.find('.//collada:instance_material', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        matrix_text = matrix_elem.text.strip().split()
        matrix = [float(x) for x in matrix_text]
        position = [matrix[3], matrix[7], matrix[11]]
        
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        material = ''
        if material_elem is not None:
            material = material_elem.get('target', '').replace('#', '')
        
        # Check for red/blue axles
        if geom_url == '32073_dat':
            if 'Red-material' in material:
                red_pos = position
                print(f"RED axle at: {position}")
            elif 'Blue-material' in material:
                blue_pos = position
                print(f"BLUE axle at: {position}")
        
        # Add gears
        teeth = gear_teeth.get(geom_url, 0)
        if teeth > 0:
            all_gears.append({
                'type': geom_url,
                'position': position,
                'teeth': teeth,
                'material': material
            })

print(f"\nTotal gears: {len(all_gears)}")

# Since the axles are disconnected, maybe we need to find
# the CLOSEST gear to each axle and trace from there

def distance(pos1, pos2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(pos1, pos2)))

# Find closest gear to red axle
if red_pos:
    min_dist = float('inf')
    red_gear = None
    for gear in all_gears:
        dist = distance(gear['position'], red_pos)
        if dist < min_dist:
            min_dist = dist
            red_gear = gear
    print(f"\nClosest to RED axle: {red_gear['type']} ({red_gear['teeth']}t) at distance {min_dist:.1f}")

# Find closest gear to blue axle
if blue_pos:
    min_dist = float('inf')
    blue_gear = None
    for gear in all_gears:
        dist = distance(gear['position'], blue_pos)
        if dist < min_dist:
            min_dist = dist
            blue_gear = gear
    print(f"Closest to BLUE axle: {blue_gear['type']} ({blue_gear['teeth']}t) at distance {min_dist:.1f}")

# Maybe the transformation is simply the ratio of the closest gears?
if red_gear and blue_gear:
    simple_ratio = blue_gear['teeth'] / red_gear['teeth']
    print(f"\nSimple ratio (blue/red): {simple_ratio}")
    print(f"For input 22319: {int(22319 * simple_ratio)}")
    print(f"Or inverse: {int(22319 / simple_ratio)}")

# Let's also check if there's a pattern in the Z-coordinates
print("\n=== Z-COORDINATE ANALYSIS ===")
z_coords = sorted(set(round(g['position'][2], 1) for g in all_gears))
print(f"Unique Z-levels: {z_coords}")

# Group by Z and see the pattern
for z in z_coords:
    gears_at_z = [g for g in all_gears if abs(g['position'][2] - z) < 0.5]
    if gears_at_z:
        teeth_list = [g['teeth'] for g in gears_at_z]
        print(f"Z={z:.1f}: {len(gears_at_z)} gears, teeth: {teeth_list[:5]}...")

# Check for specific mathematical transformations
print("\n=== TESTING SPECIFIC TRANSFORMATIONS ===")
input_val = 22319

# Common LEGO gear ratios
ratios = [
    (1, 1, "1:1 (no change)"),
    (2, 1, "2:1 (multiply by 2)"),
    (1, 2, "1:2 (divide by 2)"),
    (3, 1, "3:1 (multiply by 3)"),
    (1, 3, "1:3 (divide by 3)"),
    (3, 2, "3:2 (multiply by 1.5)"),
    (2, 3, "2:3 (multiply by 0.667)"),
    (5, 3, "5:3 (multiply by 1.667)"),
    (8, 3, "8:3 (multiply by 2.667)"),
]

for num, den, desc in ratios:
    result = int(input_val * num / den)
    print(f"{desc}: {input_val} -> {result}")

# Maybe it's based on the total number of gears?
print(f"\nTotal gears: {len(all_gears)}")
print(f"Maybe multiply by number of gears? {input_val * len(all_gears)}")
print(f"Or divide? {input_val // len(all_gears) if len(all_gears) > 0 else 0}")

# Or based on the index difference (118)?
print(f"\nIndex difference was 118")
print(f"Add 118? {input_val + 118}")
print(f"Subtract 118? {input_val - 118}")
print(f"Multiply by 118? {input_val * 118}")
print(f"Divide by 118? {input_val // 118}")

# Check if it's a modulo operation
print(f"\nModulo operations:")
print(f"mod 256: {input_val % 256}")
print(f"mod 1000: {input_val % 1000}")
print(f"mod 10000: {input_val % 10000}")