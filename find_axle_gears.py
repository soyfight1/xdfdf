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
    '32270_dat': 12, # Gear 12 Tooth Double Bevel
    '6589_dat': 12,  # Gear 12 Tooth Bevel
    '6573_dat': 24,  # Differential Gear Case (contains gears)
}

# Find all nodes in visual_scene
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

# Extract all pieces with their positions
all_pieces = []
red_axle_pos = [135.712, -310.354, 33.9119]
blue_axle_pos = [298.261, 524.844, 34.1199]

for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    material_elem = node.find('.//collada:instance_material', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        matrix_text = matrix_elem.text.strip().split()
        matrix = [float(x) for x in matrix_text]
        
        # Extract position (translation part of matrix)
        position = [matrix[3], matrix[7], matrix[11]]
        
        # Get geometry type
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        # Get material if exists
        material = ''
        if material_elem is not None:
            material = material_elem.get('target', '').replace('#', '')
        
        piece_info = {
            'type': geom_url,
            'position': position,
            'material': material,
            'teeth': gear_teeth.get(geom_url, 0)
        }
        
        all_pieces.append(piece_info)

# Function to calculate distance
def distance(pos1, pos2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(pos1, pos2)))

print("=== SEARCHING FOR GEARS AT AXLE POSITIONS ===")
print(f"Red axle position: {red_axle_pos}")
print(f"Blue axle position: {blue_axle_pos}")

# Find all pieces at or very near the axle positions
tolerance = 1.0  # Very close tolerance

print("\n--- Pieces at RED axle position ---")
red_gears = []
for piece in all_pieces:
    dist = distance(piece['position'], red_axle_pos)
    if dist < tolerance:
        print(f"  {piece['type']} at {piece['position']} (dist: {dist:.3f})")
        if piece['teeth'] > 0:
            red_gears.append(piece)

print("\n--- Pieces at BLUE axle position ---")
blue_gears = []
for piece in all_pieces:
    dist = distance(piece['position'], blue_axle_pos)
    if dist < tolerance:
        print(f"  {piece['type']} at {piece['position']} (dist: {dist:.3f})")
        if piece['teeth'] > 0:
            blue_gears.append(piece)

# Look for pieces on the same X,Y coordinates but different Z
print("\n--- Pieces on same X,Y as RED axle (different Z) ---")
for piece in all_pieces:
    if (abs(piece['position'][0] - red_axle_pos[0]) < 5 and 
        abs(piece['position'][1] - red_axle_pos[1]) < 5 and
        abs(piece['position'][2] - red_axle_pos[2]) > 1):
        print(f"  {piece['type']} ({piece['teeth']} teeth) at {piece['position']}")
        if piece['teeth'] > 0:
            red_gears.append(piece)

print("\n--- Pieces on same X,Y as BLUE axle (different Z) ---")
for piece in all_pieces:
    if (abs(piece['position'][0] - blue_axle_pos[0]) < 5 and 
        abs(piece['position'][1] - blue_axle_pos[1]) < 5 and
        abs(piece['position'][2] - blue_axle_pos[2]) > 1):
        print(f"  {piece['type']} ({piece['teeth']} teeth) at {piece['position']}")
        if piece['teeth'] > 0:
            blue_gears.append(piece)

print(f"\n=== SUMMARY ===")
print(f"Red axle has {len(red_gears)} gears attached")
print(f"Blue axle has {len(blue_gears)} gears attached")

# If we found gears, let's see what they are
if red_gears:
    print("\nRed axle gears:")
    for g in red_gears:
        print(f"  {g['type']} with {g['teeth']} teeth at Z={g['position'][2]:.1f}")

if blue_gears:
    print("\nBlue axle gears:")
    for g in blue_gears:
        print(f"  {g['type']} with {g['teeth']} teeth at Z={g['position'][2]:.1f}")

# Let's also look for nearby gears with more tolerance
print("\n=== NEARBY GEARS (within 50 units) ===")
print("\nNear RED axle:")
for piece in all_pieces:
    if piece['teeth'] > 0:
        dist = distance(piece['position'], red_axle_pos)
        if dist < 50:
            print(f"  {piece['type']} ({piece['teeth']}t) at {piece['position']} - dist: {dist:.1f}")

print("\nNear BLUE axle:")
for piece in all_pieces:
    if piece['teeth'] > 0:
        dist = distance(piece['position'], blue_axle_pos)
        if dist < 50:
            print(f"  {piece['type']} ({piece['teeth']}t) at {piece['position']} - dist: {dist:.1f}")