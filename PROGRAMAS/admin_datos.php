<?php
include("conexion.php");

/* ================= VENTAS ================= */
$res = $conexion->query("SELECT SUM(total) as total FROM pedidos");
$ventas = $res->fetch_assoc()['total'] ?? 0;

/* ================= USUARIOS ================= */
$totalUsuarios = $conexion->query("SELECT COUNT(*) as total FROM usuarios")->fetch_assoc()['total'];

$usuariosActivos = $conexion->query("SELECT COUNT(*) as total FROM usuarios WHERE activo=1")->fetch_assoc()['total'];

$usuariosInactivos = $conexion->query("SELECT COUNT(*) as total FROM usuarios WHERE activo=0")->fetch_assoc()['total'];

/* ================= PRODUCTOS ACTIVOS ================= */
$activos = $conexion->query("SELECT COUNT(*) as total FROM productos WHERE activo=1")->fetch_assoc()['total'];

/* ================= TOP PRODUCTOS ================= */
$top = $conexion->query("
    SELECT producto as nombre, SUM(salida_total) as total
    FROM kardex
    GROUP BY producto
    ORDER BY total DESC
    LIMIT 5
");

$top5 = [];
while($row = $top->fetch_assoc()){
    $top5[] = $row;
}

/* ================= GRAFICA ================= */
$grafica = $conexion->query("
    SELECT DATE(fecha_pedido) as fecha, SUM(total) as total
    FROM pedidos
    GROUP BY DATE(fecha_pedido)
");

$graficaData = [];
while($row = $grafica->fetch_assoc()){
    $graficaData[] = $row;
}

/* ================= ÚLTIMOS PEDIDOS ================= */
$ultimos = $conexion->query("
    SELECT * FROM pedidos ORDER BY id_pedido DESC LIMIT 5
");

$ultimosData = [];
while($row = $ultimos->fetch_assoc()){
    $ultimosData[] = $row;
}

/* ================= RESPUESTA ================= */
echo json_encode([
    "ventas" => $ventas,
    "usuarios" => $totalUsuarios,
    "usuarios_activos" => $usuariosActivos,
    "usuarios_inactivos" => $usuariosInactivos,
    "activos" => $activos,
    "top5" => $top5,
    "grafica" => $graficaData,
    "ultimos" => $ultimosData
]);
?>