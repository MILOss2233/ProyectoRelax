<?php
include("conexion.php");

$method = $_SERVER['REQUEST_METHOD'];

/* ================= GET ================= */
if ($method == "GET") {

    $res = $conexion->query("SELECT * FROM productos");

    $data = [];
    while($row=$res->fetch_assoc()){
        $data[]=$row;
    }

    echo json_encode($data);
}

/* ================= POST ================= */
if ($method == "POST") {

    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $stock  = $_POST['stock'];

    $imagen = $_FILES['imagen']['name'];
    move_uploaded_file($_FILES['imagen']['tmp_name'], "../IMAGENES/".$imagen);

    $conexion->query("
        INSERT INTO productos(nombre,precio,imagen,stock,activo)
        VALUES('$nombre','$precio','$imagen','$stock',1)
    ");

    $id_producto = $conexion->insert_id;

    $total = $stock * $precio;

    $conexion->query("
        INSERT INTO kardex(
            id_producto, producto, referencia,
            entrada_cantidad, entrada_costo, entrada_total,
            saldo_cantidad, saldo_costo, saldo_total,
            cliente, fecha
        )
        VALUES(
            '$id_producto','$nombre','Entrada inicial',
            '$stock','$precio','$total',
            '$stock','$precio','$total',
            'ADMIN', NOW()
        )
    ");

    echo "ok";
}

/* ================= PUT ================= */
if ($method == "PUT") {

    $data = json_decode(file_get_contents("php://input"), true);

    $id = $data['id'];

    // 🔥 SOLO CAMBIO DE ACTIVO
    if(isset($data['activo'])){
        $conexion->query("
            UPDATE productos SET activo='{$data['activo']}'
            WHERE id_producto='$id'
        ");
        echo json_encode(["estado"=>"ok"]);
        exit();
    }

    // 🔥 EDICIÓN NORMAL
    $precio = $data['precio'];
    $nuevo_stock = $data['stock'];

    $res = $conexion->query("SELECT nombre, stock FROM productos WHERE id_producto='$id'");
    $p = $res->fetch_assoc();

    $stock_actual = $p['stock'];

    $resK = $conexion->query("
        SELECT saldo_cantidad, saldo_total
        FROM kardex
        WHERE id_producto='$id'
        ORDER BY id_kardex DESC LIMIT 1
    ");

    $k = $resK->fetch_assoc();

    $saldo_cant = $k ? $k['saldo_cantidad'] : 0;
    $saldo_total = $k ? $k['saldo_total'] : 0;

    $diferencia = $nuevo_stock - $stock_actual;

    if($diferencia > 0){

        $entrada_total = $diferencia * $precio;
        $nuevo_total = $saldo_total + $entrada_total;
        $nueva_cantidad = $saldo_cant + $diferencia;
        $promedio = $nuevo_total / $nueva_cantidad;

        $conexion->query("
            INSERT INTO kardex(
                id_producto, producto, referencia,
                entrada_cantidad, entrada_costo, entrada_total,
                saldo_cantidad, saldo_costo, saldo_total,
                cliente, fecha
            )
            VALUES(
                '$id','".$p['nombre']."','Ajuste entrada',
                '$diferencia','$precio','$entrada_total',
                '$nueva_cantidad','$promedio','$nuevo_total',
                'ADMIN', NOW()
            )
        ");

    } elseif($diferencia < 0){

        $salida = abs($diferencia);
        $promedio = ($saldo_cant > 0) ? ($saldo_total / $saldo_cant) : 0;

        $salida_total = $salida * $promedio;
        $nuevo_total = $saldo_total - $salida_total;
        $nueva_cantidad = $saldo_cant - $salida;

        $conexion->query("
            INSERT INTO kardex(
                id_producto, producto, referencia,
                salida_cantidad, salida_costo, salida_total,
                saldo_cantidad, saldo_costo, saldo_total,
                cliente, fecha
            )
            VALUES(
                '$id','".$p['nombre']."','Ajuste salida',
                '$salida','$promedio','$salida_total',
                '$nueva_cantidad','$promedio','$nuevo_total',
                'ADMIN', NOW()
            )
        ");
    }

    $conexion->query("
        UPDATE productos 
        SET precio='$precio', stock='$nuevo_stock'
        WHERE id_producto='$id'
    ");

    echo json_encode(["estado"=>"ok"]);
}
?>