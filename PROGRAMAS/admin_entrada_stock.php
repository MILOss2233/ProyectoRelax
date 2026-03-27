<?php
include("conexion.php");

/* 🔥 LEER DATA */
$data = json_decode(file_get_contents("php://input"), true);

/* 🚨 VALIDACIONES (AQUÍ VA LO QUE TE DIJE) */
if(!$data){
    echo json_encode(["estado"=>"error","msg"=>"No llegó data"]);
    exit();
}

if(!isset($data['id'])){
    echo json_encode(["estado"=>"error","msg"=>"ID no llegó"]);
    exit();
}

/* 🔥 VARIABLES */
$id = $data['id'];
$cantidad = $data['cantidad'];
$precio = $data['precio'];
$fecha = $data['fecha'];

/* 🚨 VALIDAR PRODUCTO (MUY IMPORTANTE) */
$res = $conexion->query("SELECT nombre FROM productos WHERE id_producto='$id'");

if($res->num_rows == 0){
    echo json_encode(["estado"=>"error","msg"=>"Producto no existe"]);
    exit();
}

$p = $res->fetch_assoc();

/* 🔍 ÚLTIMO KARDEX */
$resK = $conexion->query("
    SELECT saldo_cantidad, saldo_total
    FROM kardex
    WHERE id_producto='$id'
    ORDER BY id_kardex DESC LIMIT 1
");

$k = $resK->fetch_assoc();

$saldo_cant = $k ? $k['saldo_cantidad'] : 0;
$saldo_total = $k ? $k['saldo_total'] : 0;

/* 📥 ENTRADA */
$entrada_total = $cantidad * $precio;

/* 🔥 PROMEDIO NUEVO */
$nueva_cantidad = $saldo_cant + $cantidad;
$nuevo_total = $saldo_total + $entrada_total;

/* 🚨 EVITAR DIVISIÓN POR 0 */
$nuevo_promedio = ($nueva_cantidad > 0) ? ($nuevo_total / $nueva_cantidad) : 0;

/* 🟢 ACTUALIZAR STOCK */
$conexion->query("
    UPDATE productos 
    SET stock='$nueva_cantidad'
    WHERE id_producto='$id'
");

/* 🟢 INSERTAR EN KARDEX */
$conexion->query("
    INSERT INTO kardex(
        id_producto, producto, referencia,
        entrada_cantidad, entrada_costo, entrada_total,
        saldo_cantidad, saldo_costo, saldo_total,
        cliente, fecha
    )
    VALUES(
        '$id','".$p['nombre']."','Compra proveedor',
        '$cantidad','$precio','$entrada_total',
        '$nueva_cantidad','$nuevo_promedio','$nuevo_total',
        'ADMIN','$fecha'
    )
");

/* ✅ RESPUESTA */
echo json_encode(["estado"=>"ok"]);
?>