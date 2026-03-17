if (!localStorage.getItem("usuarioActivo")) {
    window.location.href = "login.html";
}

document.addEventListener("DOMContentLoaded", () => {

    const contenedor = document.getElementById("listaDeseos");
    const cargando = document.getElementById("cargando");

    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    cargando.remove();

    if (deseos.length === 0) {
        contenedor.innerHTML = `
            <div class="vacio">
                <img src="/IMAGENES/adorable-ilustracion-oveja-acuarela_137871-564.avif">
                <h3>Tu lista está vacía</h3>
                <p>Agrega productos para verlos aquí</p>
                <a href="index.html" class="btn-principal">Ver productos</a>
            </div>
        `;
        return;
    }

    deseos.forEach(p => {
        contenedor.innerHTML += `
            <article class="wishlist-card">
                <img src="/IMAGENES/${p.imagen}">
                <div class="info">
                    <h4>${p.nombre}</h4>
                    <span>$${p.precio}</span>
                    <button onclick="eliminar(${p.id})">Eliminar</button>
                </div>
            </article>
        `;
    });
});

function eliminar(id) {
    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];
    deseos = deseos.filter(p => p.id !== id);
    localStorage.setItem("listaDeseos", JSON.stringify(deseos));
    location.reload();
}
function irAPago() {
    window.location.href = "pago.html";
}
