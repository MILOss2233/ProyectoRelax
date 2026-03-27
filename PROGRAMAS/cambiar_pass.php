<?php
include("conexion.php");

$correo = $_POST['correo'] ?? '';
$pass = $_POST['pass'] ?? '';

if(empty($correo) || empty($pass)){
    echo json_encode(["estado"=>"error"]);
    exit();
}

// verificar usuario
$res = $conexion->query("SELECT * FROM usuarios WHERE correo='$correo'");

if($res->num_rows == 0){
    echo json_encode(["estado"=>"error"]);
    exit();
}

// 🔥 actualizar contraseña y activar usuario
$conexion->query("
    UPDATE usuarios 
    SET contrasena='$pass', activo=1
    WHERE correo='$correo'
");

echo json_encode(["estado"=>"ok"]);
?>