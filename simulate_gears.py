#!/usr/bin/env python3
"""
Simulate the complete gear system based on the COLLADA file.
Since the red and blue axles are disconnected, there must be a virtual connection.
"""

import xml.etree.ElementTree as ET
from collections import defaultdict
import math

# Parse the COLLADA file
tree = ET.parse('VirtualMachine1.dae')
root = tree.getroot()
ns = {'collada': 'http://www.collada.org/2005/11/COLLADASchema'}

# Gear teeth counts
gear_teeth = {
    '3647_dat': 8,
    '3648b_dat': 24,
    '3649_dat': 16,
    '32270_dat': 12,
    '6589_dat': 12,
    '6573_dat': 24,  # Differential - special handling needed
}

# Extract all gears
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

gears = []
for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        matrix_text = matrix_elem.text.strip().split()
        matrix = [float(x) for x in matrix_text]
        position = [matrix[3], matrix[7], matrix[11]]
        
        geom_url = geom_elem.get('url', '').replace('#', '')
        teeth = gear_teeth.get(geom_url, 0)
        
        if teeth > 0:
            gears.append({
                'type': geom_url,
                'position': position,
                'teeth': teeth
            })

print(f"Total gears found: {len(gears)}")

# Group gears by Z-level
z_levels = defaultdict(list)
for gear in gears:
    z = round(gear['position'][2])
    z_levels[z].append(gear)

print("\n=== GEARS BY Z-LEVEL (rounded) ===")
for z in sorted(z_levels.keys()):
    print(f"Z={z}: {len(z_levels[z])} gears")

# Calculate total gear ratio if all gears were connected
# This is a simplification - assuming a linear chain
all_ratios = []
for i in range(len(gears) - 1):
    if gears[i]['teeth'] > 0 and gears[i+1]['teeth'] > 0:
        ratio = gears[i+1]['teeth'] / gears[i]['teeth']
        all_ratios.append(ratio)

if all_ratios:
    total_ratio = 1
    for r in all_ratios:
        total_ratio *= r
    print(f"\nIf all gears were connected linearly:")
    print(f"Total ratio would be: {total_ratio}")

# Look for patterns in gear arrangements
print("\n=== GEAR TYPE DISTRIBUTION ===")
type_count = defaultdict(int)
for gear in gears:
    type_count[gear['type']] += 1

for gtype, count in sorted(type_count.items()):
    teeth = gear_teeth[gtype]
    print(f"{gtype} ({teeth}t): {count} pieces")

# Calculate some specific ratios
print("\n=== POSSIBLE GEAR RATIOS ===")
print("Based on the gear types present:")
print("8t -> 24t = 3:1 (multiply by 3)")
print("24t -> 8t = 1:3 (divide by 3)")
print("12t -> 24t = 2:1 (multiply by 2)")
print("24t -> 12t = 1:2 (divide by 2)")
print("8t -> 12t = 3:2 (multiply by 1.5)")
print("12t -> 8t = 2:3 (multiply by 0.667)")
print("16t -> 24t = 3:2 (multiply by 1.5)")
print("24t -> 16t = 2:3 (multiply by 0.667)")

# Since we have many 12t and 24t gears, and some 8t gears
# The most common ratios would be 2:1 or 1:2

# Let's count specific gear combinations
print("\n=== GEAR COMBINATION ANALYSIS ===")
gear_8 = sum(1 for g in gears if g['teeth'] == 8)
gear_12 = sum(1 for g in gears if g['teeth'] == 12)
gear_16 = sum(1 for g in gears if g['teeth'] == 16)
gear_24 = sum(1 for g in gears if g['teeth'] == 24)

print(f"8-tooth gears: {gear_8}")
print(f"12-tooth gears: {gear_12}")
print(f"16-tooth gears: {gear_16}")
print(f"24-tooth gears: {gear_24}")

# The prevalence of 12 and 24 tooth gears suggests a 2:1 ratio system
# But we need to find the actual path from red to blue

# Since the axles are disconnected, maybe the answer is based on
# a calculation using the total number of gears or their arrangement

print("\n=== VIRTUAL MACHINE HYPOTHESIS ===")
print("The 'virtual machine' might not be a physical gear system.")
print("It could be a mathematical transformation based on:")
print("1. The number of each type of gear")
print("2. A specific sequence or pattern in the gear arrangement")
print("3. A calculation based on the positions")

# Try to find a mathematical pattern
# Count total teeth
total_teeth = sum(g['teeth'] for g in gears)
print(f"\nTotal teeth in system: {total_teeth}")

# Average gear ratio
if len(gears) > 1:
    avg_teeth = total_teeth / len(gears)
    print(f"Average teeth per gear: {avg_teeth:.2f}")

# Based on the gear distribution, let's guess the transformation
# We have many 12t gears (bevel gears) and several 24t gears
# The ratio 24:12 = 2:1 is very common

print("\n=== SUGGESTED TRANSFORMATION ===")
print("Based on the gear analysis:")
print("Most likely transformation: multiply by 2 (ratio 2:1)")
print("Alternative: divide by 2 (ratio 1:2)")
print("Another possibility: multiply by 3 (ratio 3:1 from 8t to 24t)")