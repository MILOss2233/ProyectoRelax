<?php
session_start();
include("conexion.php");

$usuario = $_POST['usuario'];
$password = $_POST['password'];

$sql = "SELECT * FROM usuarios WHERE usuario='$usuario'";
$resultado = $conexion->query($sql);

if ($resultado->num_rows > 0) {

    $fila = $resultado->fetch_assoc();

    // 🔴 USUARIO INACTIVO (usa ACTIVO = 0)
    if($fila['activo'] == 0){
        echo json_encode([
            "estado" => "inactivo"
        ]);
        exit();
    }

    // 🔐 VALIDAR PASSWORD
    if($fila['contrasena'] == $password){

        $_SESSION['id_usuario'] = $fila['id_usuario'];
        $_SESSION['usuario'] = $fila['usuario'];
        $_SESSION['rol'] = $fila['id_rol'];

        echo json_encode([
            "estado" => "ok",
            "usuario" => $fila['usuario'],
            "rol" => $fila['id_rol']
        ]);

    } else {
        echo json_encode(["estado"=>"error"]);
    }

} else {
    echo json_encode(["estado"=>"error"]);
}
?>