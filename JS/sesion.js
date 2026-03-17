const usuarioActivo = localStorage.getItem("usuarioActivo");

const btnLogin = document.getElementById("btnLogin");
const userSession = document.getElementById("userSession");
const nombreUsuario = document.getElementById("nombreUsuario");

if (usuarioActivo) {
    if (btnLogin) btnLogin.style.display = "none";
    if (userSession) userSession.style.display = "flex";
    if (nombreUsuario) nombreUsuario.textContent = usuarioActivo;
} else {
    if (btnLogin) btnLogin.style.display = "flex";
    if (userSession) userSession.style.display = "none";
}

function cerrarSesion() {
    localStorage.removeItem("usuarioActivo");
    location.reload();
}
