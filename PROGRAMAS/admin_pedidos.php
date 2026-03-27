<?php
include("conexion.php");

$method = $_SERVER['REQUEST_METHOD'];

/* ================= GET (LISTAR PEDIDOS) ================= */
if ($method == "GET") {

    $res = $conexion->query("
        SELECT * FROM pedidos 
        ORDER BY id_pedido DESC
    ");

    $data = [];

    while($row = $res->fetch_assoc()){
        $data[] = $row;
    }

    echo json_encode($data);
    exit();
}

/* ================= PUT (CAMBIAR ESTADO) ================= */
if ($method == "PUT") {

    $data = json_decode(file_get_contents("php://input"), true);

    if(!isset($data['id']) || !isset($data['estado'])){
        echo json_encode(["estado"=>"error","msg"=>"Datos incompletos"]);
        exit();
    }

    $id = $data['id'];
    $estado = $data['estado'];

    $conexion->query("
        UPDATE pedidos 
        SET estado='$estado'
        WHERE id_pedido='$id'
    ");

    echo json_encode(["estado"=>"ok"]);
    exit();
}
?>