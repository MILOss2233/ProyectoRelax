document.addEventListener("DOMContentLoaded", () => {

    const contenedor = document.getElementById("listaDeseos");
    const cargando = document.getElementById("cargando");

    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    if (cargando) cargando.remove();

    contenedor.innerHTML = "";

    if (deseos.length === 0) {
        contenedor.innerHTML = "<h3>Tu carrito está vacío</h3>";
        return;
    }

    let total = 0;

    deseos.forEach(p => {

        total += p.precio * p.cantidad;

        contenedor.innerHTML += `
            <article class="wishlist-card">
                <img src="../IMAGENES/${p.imagen}">
                <div class="info">
                    <h4>${p.nombre}</h4>

                    <p>Cantidad: ${p.cantidad}</p>

                    <span>$${p.precio * p.cantidad}</span>

                    <button onclick="sumar(${p.id})">➕</button>
                    <button onclick="restar(${p.id})">➖</button>
                    <button onclick="eliminarProducto(${p.id})">❌ Eliminar</button>
                </div>
            </article>
        `;
    });

    contenedor.innerHTML += `
        <h2 style="margin-top:20px;">Total: $${total}</h2>
    `;
});

// ➕
function sumar(id) {
    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    deseos.forEach(p => {
        if (Number(p.id) === Number(id)) p.cantidad++;
    });

    localStorage.setItem("listaDeseos", JSON.stringify(deseos));
    location.reload();
}

// ➖
function restar(id) {
    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    deseos = deseos.map(p => {
        if (Number(p.id) === Number(id) && p.cantidad > 1) {
            p.cantidad--;
        }
        return p;
    });

    localStorage.setItem("listaDeseos", JSON.stringify(deseos));
    location.reload();
}

// ❌
function eliminarProducto(id) {
    let deseos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    deseos = deseos.filter(p => Number(p.id) !== Number(id));

    localStorage.setItem("listaDeseos", JSON.stringify(deseos));

    location.reload();
}

// 💳
function finalizarCompra(){

    let carrito = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    const nombre = document.getElementById("nombreCliente").value;
    const fecha = document.getElementById("fechaCompra").value;

    if(carrito.length === 0){
        alert("Carrito vacío");
        return;
    }

    if(!nombre || !fecha){
        alert("Completa nombre y fecha");
        return;
    }

    fetch("../PROGRAMAS/guardar_pedido.php",{
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            carrito: carrito,
            nombre: nombre,
            fecha: fecha
        })
    })
    .then(res => res.text())
    .then(txt => {

        console.log("RESPUESTA:", txt);

        let data;

        try{
            data = JSON.parse(txt);
        }catch(e){
            alert("Error en el servidor");
            return;
        }

        if(data.estado === "ok"){
            alert("✅ Compra realizada con éxito");

            localStorage.removeItem("listaDeseos");

            location.reload();
        }
        else if(data.estado === "sin_stock"){
            alert("❌ No hay stock suficiente");
        }
        else{
            alert("❌ Error al comprar");
        }

    })
    .catch(()=>{
        alert("❌ Error de conexión");
    });
}