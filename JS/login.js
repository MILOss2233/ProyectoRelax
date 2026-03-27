function login() {
    const usuario = document.getElementById("usuario").value.trim();
    const password = document.getElementById("password").value.trim();
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

    loader.style.display = "block";

    fetch("../PROGRAMAS/login.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `usuario=${encodeURIComponent(usuario)}&password=${encodeURIComponent(password)}`
    })
    .then(res => res.text())
    .then(text => {

        let data;

        try {
            data = JSON.parse(text);
        } catch (e) {
            alert("Error del servidor");
            loader.style.display = "none";
            return;
        }

        loader.style.display = "none";

        // 🔴 USUARIO INACTIVO
        if (data.estado === "inactivo") {
            alert("Usuario inactivo, debes cambiar la contraseña");
            window.location.href = "../HTML/recuperar.html";
            return;
        }

        // ✅ LOGIN OK
        if (data.estado === "ok") {

            if (parseInt(data.rol) === 1) {
                window.location.replace("../PROGRAMAS/admin.php");
            } else {
                window.location.replace("../HTML/index.html");
            }

        } else {
            alert("Usuario o contraseña incorrectos");
        }

    })
    .catch(error => {
        loader.style.display = "none";
        alert("Error en el servidor");
        console.error(error);
    });
}