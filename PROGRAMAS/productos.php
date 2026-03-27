<?php
include("conexion.php");

$sql = "SELECT * FROM productos WHERE activo=1";
$resultado = $conexion->query($sql);

$productos = [];

while($fila = $resultado->fetch_assoc()){
    $productos[] = $fila;
}

echo json_encode($productos);
?>