<?php
session_start();
include("conexion.php");

if(!isset($_SESSION['id_usuario'])){
    echo json_encode(["error"=>"No logueado"]);
    exit;
}

$id = $_SESSION['id_usuario'];

/* OBTENER DATOS */
if($_SERVER["REQUEST_METHOD"] == "GET"){

    $res = $conexion->query("SELECT nombre, direccion, telefono, foto FROM usuarios WHERE id_usuario = $id");
    $data = $res->fetch_assoc();

    echo json_encode($data);
    exit;
}

/* ACTUALIZAR */
if($_SERVER["REQUEST_METHOD"] == "POST"){

    $nombre = $_POST["nombre"];
    $direccion = $_POST["direccion"];
    $telefono = $_POST["telefono"];

    // 🔥 SI HAY IMAGEN
    if(isset($_FILES["foto"]) && $_FILES["foto"]["name"] != ""){

        $fotoNombre = time()."_".$_FILES["foto"]["name"];
        move_uploaded_file($_FILES["foto"]["tmp_name"], "../IMAGENES/".$fotoNombre);

        $sql = "UPDATE usuarios SET 
            nombre='$nombre',
            direccion='$direccion',
            telefono='$telefono',
            foto='$fotoNombre'
            WHERE id_usuario=$id";

    } else {

        $sql = "UPDATE usuarios SET 
            nombre='$nombre',
            direccion='$direccion',
            telefono='$telefono'
            WHERE id_usuario=$id";
    }

    if($conexion->query($sql)){
        echo "ok";
    } else {
        echo "error";
    }
}
?>