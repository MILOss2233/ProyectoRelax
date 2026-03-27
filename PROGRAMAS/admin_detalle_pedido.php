<?php
include("conexion.php");

$id = $_GET['id'];

$res = $conexion->query("
SELECT dp.*, p.nombre 
FROM detalle_pedido dp
JOIN productos p ON dp.id_producto = p.id_producto
WHERE dp.id_pedido = $id
");

$data = [];

while($row=$res->fetch_assoc()){
    $data[]=$row;
}

echo json_encode($data);