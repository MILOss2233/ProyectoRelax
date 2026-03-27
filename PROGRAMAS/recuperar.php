<?php
include("conexion.php");

// Recibir JSON
$input = json_decode(file_get_contents("php://input"), true);
$email = $input['email'] ?? '';

if(!$email){
    echo "Correo inválido";
    exit;
}

// Verificar usuario
$user = $conexion->query("SELECT id_usuario FROM usuarios WHERE correo='$email'")->fetch_assoc();

if(!$user){
    echo "El correo no está registrado";
    exit;
}

// Generar token
$token = bin2hex(random_bytes(16));
$expira = date("Y-m-d H:i:s", strtotime("+1 hour"));

// Guardar token
$conexion->query("UPDATE usuarios SET token_recuperacion='$token', token_expira='$expira' WHERE id_usuario=".$user['id_usuario']);

// Enviar correo con enlace
$enlace = "http://localhost/Proyecto/HTML/nueva_contrasena.html?token=$token";

//mail($email, "Recuperar Contraseña", "Haz click aquí: $enlace");

echo "Copia este enlace y ábrelo:\n\n$enlace";
?>