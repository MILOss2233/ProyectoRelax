<?php
include("conexion.php");

$res = $conexion->query("
SELECT DATE(fecha_pedido) as fecha, SUM(total) as total
FROM pedidos
GROUP BY fecha
");

$fechas = [];
$totales = [];

while($row = $res->fetch_assoc()){
    $fechas[] = $row['fecha'];
    $totales[] = $row['total'];
}

echo json_encode([
    "fechas"=>$fechas,
    "totales"=>$totales
]);