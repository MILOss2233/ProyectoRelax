<?php
include("conexion.php");

// Validar datos
if (
    !isset($_POST['email']) ||
    !isset($_POST['usuario']) ||
    !isset($_POST['password'])
) {
    echo "error";
    exit();
}

$email = trim($_POST['email']);
$usuario = trim($_POST['usuario']);
$password = trim($_POST['password']);

// 🔴 VERIFICAR USUARIO
$sql_user = "SELECT * FROM usuarios WHERE usuario='$usuario'";
$res_user = $conexion->query($sql_user);

if ($res_user->num_rows > 0) {
    echo "usuario_existe";
    exit();
}

// 🔴 VERIFICAR CORREO
$sql_email = "SELECT * FROM usuarios WHERE correo='$email'";
$res_email = $conexion->query($sql_email);

if ($res_email->num_rows > 0) {
    echo "correo_existe";
    exit();
}

// INSERTAR
$sql = "INSERT INTO usuarios (correo, usuario, contrasena, id_rol, fecha_ingreso) 
VALUES ('$email', '$usuario', '$password', 2, NOW())";

if ($conexion->query($sql) == TRUE) {
    echo "ok";
} else {
    echo "error";
}
?>