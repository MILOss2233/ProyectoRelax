<?php
session_start();
include("conexion.php");

error_reporting(E_ALL);
ini_set('display_errors', 1);

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['carrito']) || count($data['carrito']) == 0) {
    echo json_encode(["estado" => "error"]);
    exit();
}

$carrito = $data['carrito'];
$nombre_cliente = $data['nombre'];
$fecha = $data['fecha'];

$id_usuario = $_SESSION['id_usuario'] ?? 1;

/* TOTAL */
$total = 0;
foreach ($carrito as $p) {
    $total += $p['precio'] * $p['cantidad'];
}

/* CREAR PEDIDO */
$conexion->query("
INSERT INTO pedidos (id_usuario, fecha_pedido, estado, total)
VALUES ('$id_usuario', '$fecha', 'pendiente', '$total')
");

$id_pedido = $conexion->insert_id;

/* DETALLE + STOCK + KARDEX */
foreach ($carrito as $p) {

    $id_producto = $p['id'];
    $cantidad = $p['cantidad'];
    $precio = $p['precio'];

    /* PRODUCTO */
    $res = $conexion->query("SELECT nombre, stock FROM productos WHERE id_producto='$id_producto'");
    $prod = $res->fetch_assoc();

    $nombre_producto = $prod['nombre'];
    $stock_actual = $prod['stock'];

    /* VALIDAR STOCK */
    if($stock_actual < $cantidad){
        echo json_encode(["estado"=>"sin_stock"]);
        exit();
    }

    /* DETALLE */
    $conexion->query("
    INSERT INTO detalle_pedido (id_pedido,id_producto,cantidad,precio_unitario)
    VALUES ('$id_pedido','$id_producto','$cantidad','$precio')
    ");

    /* NUEVO STOCK */
    $nuevo_stock = $stock_actual - $cantidad;

    $conexion->query("
    UPDATE productos SET stock = '$nuevo_stock'
    WHERE id_producto='$id_producto'
    ");

$resK = $conexion->query("
    SELECT saldo_costo, saldo_total 
    FROM kardex 
    WHERE id_producto='$id_producto'
    ORDER BY id_kardex DESC LIMIT 1
");

$k = $resK->fetch_assoc();

$costo_promedio = $k ? $k['saldo_costo'] : $precio;
$saldo_total_anterior = $k ? $k['saldo_total'] : ($stock_actual * $precio);

$salida_total = $cantidad * $costo_promedio;

$nuevo_saldo_total = $saldo_total_anterior - $salida_total;

/* KARDEX */
$conexion->query("
INSERT INTO kardex (
    id_producto,
    producto,
    referencia,
    salida_cantidad,
    salida_costo,
    salida_total,
    saldo_cantidad,
    saldo_costo,
    saldo_total,
    cliente,
    fecha
) VALUES (
    '$id_producto',
    '$nombre_producto',
    'VENTA',
    '$cantidad',
    '$costo_promedio',
    '$salida_total',
    '$nuevo_stock',
    '$costo_promedio',
    '$nuevo_saldo_total',
    '$nombre_cliente',
    '$fecha'
)
");
}

echo json_encode(["estado"=>"ok"]);
?>