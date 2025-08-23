#!/usr/bin/env python3
import xml.etree.ElementTree as ET

# Parse the COLLADA file
tree = ET.parse('VirtualMachine1.dae')
root = tree.getroot()

# Namespace
ns = {'collada': 'http://www.collada.org/2005/11/COLLADASchema'}

# Find all nodes in visual_scene
visual_scene = root.find('.//collada:visual_scene[@id="DefaultScene"]', ns)
nodes = visual_scene.findall('.//collada:node', ns) if visual_scene else []

print("=== CHECKING MATRIX INTERPRETATION ===")
print("\nMatrix format in COLLADA is 4x4 column-major:")
print("[ m0  m4  m8  m12 ]   [ Xx  Yx  Zx  Tx ]")
print("[ m1  m5  m9  m13 ] = [ Xy  Yy  Zy  Ty ]")
print("[ m2  m6  m10 m14 ]   [ Xz  Yz  Zz  Tz ]")
print("[ m3  m7  m11 m15 ]   [ 0   0   0   1  ]")
print("\nWhere T = Translation (position)")

# Check the red and blue axles specifically
for node in nodes:
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    material_elem = node.find('.//collada:instance_material', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        if geom_url == '32073_dat':  # Axle
            material = ''
            if material_elem is not None:
                material = material_elem.get('target', '').replace('#', '')
            
            if 'Red-material' in material or 'Blue-material' in material:
                matrix_text = matrix_elem.text.strip().split()
                matrix = [float(x) for x in matrix_text]
                
                color = "RED" if 'Red-material' in material else "BLUE"
                print(f"\n{color} AXLE Matrix:")
                print(f"Raw: {matrix}")
                print(f"As 4x4:")
                for i in range(4):
                    print(f"  [{matrix[i]:7.3f} {matrix[i+4]:7.3f} {matrix[i+8]:7.3f} {matrix[i+12]:7.3f}]")
                
                # Try different interpretations
                print(f"\nPossible position interpretations:")
                print(f"  Column-major (m12,m13,m14): [{matrix[12]:.3f}, {matrix[13]:.3f}, {matrix[14]:.3f}]")
                print(f"  Row-major (m3,m7,m11): [{matrix[3]:.3f}, {matrix[7]:.3f}, {matrix[11]:.3f}]")
                
                # Check rotation part
                print(f"\nRotation matrix (upper-left 3x3):")
                for i in range(3):
                    print(f"  [{matrix[i]:7.3f} {matrix[i+4]:7.3f} {matrix[i+8]:7.3f}]")

# Let's also check a gear to compare
print("\n\n=== SAMPLE GEAR FOR COMPARISON ===")
count = 0
for node in nodes:
    if count >= 2:
        break
    matrix_elem = node.find('collada:matrix', ns)
    geom_elem = node.find('.//collada:instance_geometry', ns)
    
    if matrix_elem is not None and geom_elem is not None:
        geom_url = geom_elem.get('url', '').replace('#', '')
        
        if geom_url in ['3647_dat', '3648b_dat', '6589_dat']:  # Gears
            matrix_text = matrix_elem.text.strip().split()
            matrix = [float(x) for x in matrix_text]
            
            print(f"\n{geom_url} Matrix:")
            for i in range(4):
                print(f"  [{matrix[i]:7.3f} {matrix[i+4]:7.3f} {matrix[i+8]:7.3f} {matrix[i+12]:7.3f}]")
            print(f"Position (m3,m7,m11): [{matrix[3]:.3f}, {matrix[7]:.3f}, {matrix[11]:.3f}]")
            count += 1