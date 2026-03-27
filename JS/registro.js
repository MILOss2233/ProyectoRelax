function registrar(e) {
    if (e) e.preventDefault();

    const email = document.getElementById("email").value.trim();
    const usuario = document.getElementById("usuario").value.trim();
    const password = document.getElementById("password").value.trim();
    const confirmar = document.getElementById("confirmar").value.trim();
    const robot = document.getElementById("robot").checked;
    const loader = document.getElementById("loader");

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
        alert("Confirma que no eres un robot");
        return;
    }

    loader.style.display = "block";

    fetch("../PROGRAMAS/registro.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `email=${email}&usuario=${usuario}&password=${password}`
    })
    .then(res => res.text())
    .then(data => {
        loader.style.display = "none";

        if (data.trim() === "ok") {
            alert("Registro exitoso");
            window.location.href = "login.html";
        } else if (data.trim() === "usuario_existe") {
            alert("El usuario ya existe");
        } else if (data.trim() === "correo_existe") {
            alert("Este correo ya está registrado");
        } else {
            alert("Error: " + data);
        }
    });
}