<?php
require_once __DIR__ . '/../Models/Database.php';
class ApiController {
    public static function infrastructure() {
        header('Content-Type: application/json');
        
        if (!isset($_SESSION['username'])) {
            http_response_code(401);
            echo json_encode(['error'=>'Unauthorized']);
            exit;
        }
        
        $db = Database::getInstance()->getConnection();
        if ($_SESSION['username'] === 'admin') {
            $stmt = $db->query('SELECT * FROM infrastructure ORDER BY area, name');
            $infra = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $area = $_SESSION['area'] ?? '';
            $stmt = $db->prepare('SELECT * FROM infrastructure WHERE area = ? ORDER BY name');
            $stmt->execute([$area]);
            $infra = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        echo json_encode($infra);
        exit;
    }
    
    public static function updateInfrastructure($id) {
        header('Content-Type: application/json');
        
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            http_response_code(401);
            echo json_encode(['error'=>'Unauthorized']);
            exit;
        }

        $input = file_get_contents('php://input');
        $data = json_decode($input, true);
        
        if (!$data) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid JSON data']);
            exit;
        }
        
        $db = Database::getInstance()->getConnection();
        
        $updateFields = [];
        $params = [];
        
        if (isset($data['status'])) {
            $updateFields[] = 'status = ?';
            $params[] = $data['status'];
        }
        
        if (isset($data['uptime'])) {
            $updateFields[] = 'uptime = ?';
            $params[] = $data['uptime'];
        }
        
        if (empty($updateFields)) {
            http_response_code(400);
            echo json_encode(['error' => 'No valid fields to update']);
            exit;
        }
        
        $updateFields[] = 'last_updated = CURRENT_TIMESTAMP';
        $params[] = $id;
        
        $sql = 'UPDATE infrastructure SET ' . implode(', ', $updateFields) . ' WHERE id = ?';
        
        try {
            $stmt = $db->prepare($sql);
            $stmt->execute($params);
            
            if ($stmt->rowCount() === 0) {
                http_response_code(404);
                echo json_encode(['error' => 'Infrastructure not found']);
                exit;
            }
            
            echo json_encode([
                'success' => true, 
                'message' => 'Infrastructure updated successfully'
            ]);
            
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database error']);
        }
        
        exit;
    }
} 