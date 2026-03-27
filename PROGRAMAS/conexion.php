<?php
$conexion=new mysqli("localhost","root","","relax_hogar1");
if ($conexion->connect_error){
    die("Error de conexion");
}
?>