<?php
include("conexion.php");

$res = $conexion->query("
SELECT p.nombre, SUM(dp.cantidad) as total
FROM detalle_pedido dp
JOIN productos p ON dp.id_producto = p.id_producto
GROUP BY dp.id_producto
ORDER BY total DESC
LIMIT 5
");

$data=[];

while($row=$res->fetch_assoc()){
    $data[]=$row;
}

echo json_encode($data);