<?php
session_start();

spl_autoload_register(function ($name) {
    $parts = explode('\\', $name);
    $className = array_pop($parts);
    if (preg_match('/Controller$/', $name)) {
        $name = 'Controllers/' . $name;
    }

    if (preg_match('/Model$/', $name)) {
        $name = 'Models/' . $name;
    }

    $file = $name . '.php';

    if (is_file($file)) {
        require_once $file;
    }
});

$router = new Router();

// Landing page
$router->get('/', function() {
    require __DIR__ . '/Views/landing.php';
});

// Authentication routes
$router->get('/login', 'AuthController@showLogin');
$router->post('/login', 'AuthController@login');
$router->get('/logout', 'AuthController@logout');
$router->get('/register', 'AuthController@showRegister');
$router->post('/register', 'AuthController@register');
$router->get('/username-exists', 'AuthController@usernameExists');

// Operator routes
$router->get('/operator', 'OperatorController@dashboard');
$router->get('/report', 'OperatorController@showReportForm');
$router->post('/report', 'OperatorController@submitReport');
$router->get('/reports', 'OperatorController@reports');

// Admin routes
$router->get('/admin', 'AdminController@dashboard');
$router->get('/add-infra', 'AdminController@showAddInfra');
$router->post('/add-infra', 'AdminController@addInfra');
$router->post('/delete-infra', 'AdminController@deleteInfra');
$router->get('/admin-reports', 'AdminController@reports');

// API routes
$router->get('/api/infrastructure', 'ApiController@infrastructure');
$router->put('/api/infrastructure/{id}', 'ApiController@updateInfrastructure');

$router->resolve(); 