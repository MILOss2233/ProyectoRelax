<?php
session_start();

if (isset($_SESSION['usuario'])) {
    echo json_encode([
        "estado" => "activo",
        "usuario" => $_SESSION['usuario']
    ]);
} else {
    echo json_encode(["estado" => "inactivo"]);
}
?>