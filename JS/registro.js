// 🔒 Si ya hay sesión, redirige
if (localStorage.getItem("usuarioActivo")) {
    window.location.href = "index.html";
}

function registrar() {
    const email = document.getElementById("email").value;
    const usuario = document.getElementById("usuario").value;
    const password = document.getElementById("password").value;
    const confirmar = document.getElementById("confirmar").value;
    const robot = document.getElementById("robot").checked;
    const loader = document.getElementById("loader");

    // VALIDACIONES
    if (email === "" || usuario === "" || password === "" || confirmar === "") {
        alert("Completa todos los campos");
        return;
    }

    if (password.length < 8) {
        alert("La contraseña debe tener mínimo 8 caracteres");
        return;
    }

    if (password !== confirmar) {
        alert("Las contraseñas no coinciden");
        return;
    }

    if (!robot) {
        alert("Por favor confirma que no eres un robot");
        return;
    }

    const nuevoUsuario = {
        email,
        usuario,
        password
    };

    loader.style.display = "block";

    setTimeout(() => {
        localStorage.setItem("usuarioRegistrado", JSON.stringify(nuevoUsuario));
        localStorage.setItem("usuarioActivo", usuario);
        window.location.href = "index.html";
    }, 1800);
}
