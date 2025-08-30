<?php
require_once __DIR__ . '/../Models/Database.php';

class AdminController {
    public static function dashboard() {
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            header('Location: /challenge/login'); exit;
        }
        $db = Database::getInstance()->getConnection();
        $stmt = $db->query('SELECT * FROM infrastructure ORDER BY area, name');
        $infra = $stmt->fetchAll(PDO::FETCH_ASSOC);
        require __DIR__ . '/../Views/admin_dashboard.php';
    }
    public static function showAddInfra() {
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            header('Location: /challenge/login'); exit;
        }
        require __DIR__ . '/../Views/add_infra.php';
    }
    public static function addInfra() {
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            header('Location: /challenge/login'); exit;
        }
        $db = Database::getInstance()->getConnection();
        $name = $_POST['name'] ?? '';
        $type = $_POST['type'] ?? '';
        $area = $_POST['area'] ?? '';
        $stmt = $db->prepare('INSERT INTO infrastructure (name, type, area) VALUES (?, ?, ?)');
        $stmt->execute([$name, $type, $area]);
        header('Location: /challenge/admin');
        exit;
    }
    public static function deleteInfra() {
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            header('Location: /challenge/login'); exit;
        }
        $db = Database::getInstance()->getConnection();
        $id = $_POST['id'] ?? '';
        $stmt = $db->prepare('DELETE FROM infrastructure WHERE id = ?');
        $stmt->execute([$id]);
        header('Location: /challenge/admin');
        exit;
    }
    public static function reports() {
        if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
            header('Location: /challenge/login'); exit;
        }
        $db = Database::getInstance()->getConnection();
        $stmt = $db->query('SELECT r.*, u.username, i.name as infra_name FROM reports r JOIN users u ON r.user_id = u.id JOIN infrastructure i ON r.infra_id = i.id ORDER BY r.created_at DESC');
        $reports = $stmt->fetchAll(PDO::FETCH_ASSOC);
        require __DIR__ . '/../Views/admin_reports.php';
    }
} 