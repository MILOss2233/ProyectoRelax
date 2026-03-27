const ruta = window.location.pathname;

if (!ruta.includes("login") && !ruta.includes("registro")) {

fetch("../PROGRAMAS/sesion.php")
.then(res => res.json())
.then(data => {

    const btnLogin = document.getElementById("btnLogin");
    const userSession = document.getElementById("userSession");
    const nombreUsuario = document.getElementById("nombreUsuario");

    if (!btnLogin || !userSession || !nombreUsuario) return;

    if (data.estado === "activo") {
        btnLogin.style.display = "none";
        userSession.style.display = "flex";
        nombreUsuario.textContent = data.usuario; // 👈 AQUÍ SE MUESTRA
    } else {
        btnLogin.style.display = "flex";
        userSession.style.display = "none";
    }
});

}
function cerrarSesion() {
    fetch("/Proyecto/PROGRAMAS/logout.php")
    .then(() => location.reload());
}
fetch("../PROGRAMAS/perfil_usuario.php")
.then(res=>res.json())
.then(data=>{
    if(data.nombre){
        document.getElementById("nombreUsuario").textContent = data.nombre;
    }

    if(data.foto){
        document.getElementById("fotoNav").src = "../IMAGENES/" + data.foto;
    }
});
function irPerfil(){
    window.location.href = "perfil.html";
}