// 🔒 Si ya hay sesión, redirige
if (localStorage.getItem("usuarioActivo")) {
    window.location.href = "index.html";
}

function login() {
    const usuario = document.getElementById("usuario").value;
    const password = document.getElementById("password").value;
    const robot = document.getElementById("robot").checked;
    const loader = document.getElementById("loader");

    if (usuario === "" || password === "") {
        alert("Completa todos los campos");
        return;
    }

    if (!robot) {
        alert("Confirma que no eres un robot");
        return;
    }

    const registrado = JSON.parse(localStorage.getItem("usuarioRegistrado"));

    if (!registrado || usuario !== registrado.usuario || password !== registrado.password) {
        alert("Usuario o contraseña incorrectos");
        return;
    }

    loader.style.display = "block";

    setTimeout(() => {
        localStorage.setItem("usuarioActivo", usuario);
        window.location.href = "index.html";
    }, 600); // más rápido
}
