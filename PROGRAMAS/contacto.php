<?php
if (
    !isset($_POST['nombre']) ||
    !isset($_POST['correo']) ||
    !isset($_POST['mensaje'])
){
    echo "error";
    exit();
}

$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$mensaje = $_POST['mensaje'];

// Aquí puedes guardar en BD o enviar correo
// Por ahora solo confirmamos

echo "<script>
alert('Mensaje enviado correctamente');
window.location.href = '../HTML/nosotros.php';
</script>";
?>