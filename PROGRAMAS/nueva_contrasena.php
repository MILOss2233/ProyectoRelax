<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nueva Contraseña</title>
<link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
<div class="login-container">
    <h2>Cambiar Contraseña</h2>
    <form id="nuevaForm">
        <input type="password" id="pass1" placeholder="Nueva contraseña" required>
        <input type="password" id="pass2" placeholder="Repetir contraseña" required>
        <button type="submit">Actualizar contraseña</button>
    </form>
</div>

<script>
// Obtener token de URL
const params = new URLSearchParams(window.location.search);
const token = params.get("token");

document.getElementById("nuevaForm").addEventListener("submit", function(e){
    e.preventDefault();

    const pass1 = document.getElementById("pass1").value;
    const pass2 = document.getElementById("pass2").value;

    if(pass1 !== pass2){
        alert("Las contraseñas no coinciden");
        return;
    }

    fetch("../PROGRAMAS/nueva_contrasena.php", {
        method:"POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify({token, password: pass1})
    })
    .then(res=>res.text())
    .then(data=>{
        alert(data);
        window.location.href = "login.html";
    });
});
</script>
</body>
</html>