<?php
include("conexion.php");

$data = json_decode(file_get_contents("php://input"), true);
$correo = $data['correo'];

$res = $conexion->query("SELECT id_usuario FROM usuarios WHERE correo='$correo'");

if($res->num_rows > 0){
    echo "ok";
}else{
    echo "error";
}
?>