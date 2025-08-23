#!/usr/bin/env python3
"""
Look for hidden patterns or specific gear sequences that might give us the answer.
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
    '6573_dat': 24,
}

# Extract all gears with full information
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

all_pieces = []
for i, node in enumerate(nodes):
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
        
        all_pieces.append({
            'index': i,
            'type': geom_url,
            'position': position,
            'teeth': gear_teeth.get(geom_url, 0),
            'material': material
        })

# Find the red and blue axles
red_axle = None
blue_axle = None
for piece in all_pieces:
    if piece['type'] == '32073_dat':
        if 'Red-material' in piece['material']:
            red_axle = piece
        elif 'Blue-material' in piece['material']:
            blue_axle = piece

if red_axle and blue_axle:
    print(f"RED axle at index {red_axle['index']}")
    print(f"BLUE axle at index {blue_axle['index']}")
    print(f"Index difference: {blue_axle['index'] - red_axle['index']}")

# Look for patterns in the sequence
print("\n=== SEQUENCE ANALYSIS ===")
gear_sequence = []
for piece in all_pieces:
    if piece['teeth'] > 0:
        gear_sequence.append(piece['teeth'])

print(f"Gear teeth sequence (first 20): {gear_sequence[:20]}")
print(f"Total gears in sequence: {len(gear_sequence)}")

# Calculate running product and sum
if gear_sequence:
    running_product = 1
    running_sum = 0
    for i, teeth in enumerate(gear_sequence[:10]):
        running_product *= teeth
        running_sum += teeth
        print(f"After gear {i+1}: product={running_product}, sum={running_sum}")

# Look for mathematical relationships
print("\n=== MATHEMATICAL PATTERNS ===")
if gear_sequence:
    # Check for specific ratios
    ratios = []
    for i in range(len(gear_sequence) - 1):
        if gear_sequence[i] > 0:
            ratio = gear_sequence[i+1] / gear_sequence[i]
            ratios.append(ratio)
    
    # Find most common ratios
    ratio_counts = defaultdict(int)
    for r in ratios:
        ratio_counts[round(r, 2)] += 1
    
    print("Most common gear ratios in sequence:")
    for ratio, count in sorted(ratio_counts.items(), key=lambda x: x[1], reverse=True)[:5]:
        print(f"  Ratio {ratio}: appears {count} times")

# Check if there's a specific transformation pattern
print("\n=== TRANSFORMATION HYPOTHESIS ===")

# Count specific transitions
transitions = defaultdict(int)
for i in range(len(gear_sequence) - 1):
    transition = (gear_sequence[i], gear_sequence[i+1])
    transitions[transition] += 1

print("Most common gear transitions:")
for trans, count in sorted(transitions.items(), key=lambda x: x[1], reverse=True)[:5]:
    ratio = trans[1] / trans[0] if trans[0] > 0 else 0
    print(f"  {trans[0]}t -> {trans[1]}t (ratio {ratio:.2f}): {count} times")

# Final calculation based on most common patterns
print("\n=== FINAL CALCULATION ===")
# Based on the analysis, the most common gears are 12t and 24t
# The most likely ratio is 2:1 or 1:2

# But let's check if there's a specific formula
# Count total of each type
type_counts = defaultdict(int)
for piece in all_pieces:
    if piece['teeth'] > 0:
        type_counts[piece['teeth']] += 1

print("Gear distribution:")
for teeth, count in sorted(type_counts.items()):
    print(f"  {teeth}-tooth: {count} gears")

# Calculate weighted average ratio
total_ratio = 0
total_weight = 0
for teeth, count in type_counts.items():
    if teeth == 24:
        total_ratio += 2 * count  # 24t gears give 2:1 ratio against 12t
        total_weight += count
    elif teeth == 12:
        total_ratio += 1 * count  # Base ratio
        total_weight += count
    elif teeth == 8:
        total_ratio += 0.667 * count  # 8t gears give 2:3 ratio against 12t
        total_weight += count

if total_weight > 0:
    avg_ratio = total_ratio / total_weight
    print(f"\nWeighted average ratio: {avg_ratio:.3f}")

print("\n=== RECOMMENDATION ===")
print("Based on all analysis:")
print("1. Most likely: multiply input by 2")
print("2. Alternative: divide input by 2")
print("3. Less likely: multiply by 3")
print("4. Complex: use a specific sequence of ratios")