<?php
include("conexion.php");

$res = $conexion->query("SELECT * FROM kardex ORDER BY id_kardex DESC");

$data = [];

while($row = $res->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);
?>