<?php

class Router {
    private $routes = [];

    public function get($path, $callback) {
        $this->routes['GET'][$path] = $callback;
    }

    public function post($path, $callback) {
        $this->routes['POST'][$path] = $callback;
    }

    public function put($path, $callback) {
        $this->routes['PUT'][$path] = $callback;
    }

    public function view($view, $data = []) {
        require_once '/Views/' . $view . '.php';
    }

    public function resolve() {
        $method = $_SERVER['REQUEST_METHOD'];
        $path = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);


        if (isset($this->routes[$method][$path])) {
            $callback = $this->routes[$method][$path];
            $this->executeCallback($callback);
            return;
        }

        foreach ($this->routes[$method] ?? [] as $pattern => $callback) {
            if (strpos($pattern, '{') !== false) {
                $regex = $this->convertPatternToRegex($pattern);
                if (preg_match($regex, $path, $matches)) {
                    array_shift($matches); 
                    $this->executeCallback($callback, $matches);
                    return;
                }
            }
        }

        http_response_code(404);
        echo '404 Not Found';
    }

    private function convertPatternToRegex($pattern) {
        $regex = preg_replace('/\{([^}]+)\}/', '([^/]+)', $pattern);
        return '#^' . $regex . '$#';
    }

    private function executeCallback($callback, $params = []) {
        if (is_callable($callback)) {
            return call_user_func_array($callback, $params);
        } else {
            $callback = explode('@', $callback);
            $controller = new $callback[0]();
            call_user_func_array([$controller, $callback[1]], $params);
        }
    }
} 