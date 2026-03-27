let productosGlobal = [];

fetch("../PROGRAMAS/productos.php")
.then(res => res.json())
.then(data => {

    productosGlobal = data;

    const contenedor = document.querySelector(".grid");
    contenedor.innerHTML = "";

   data.forEach(p => {

    let boton = "";

    if(p.stock <= 0){
        boton = `<p style="color:red;font-weight:bold;">AGOTADO</p>`;
    } else {
        boton = `
        <button onclick="agregarCarrito(${p.id_producto})">
            🛒 Agregar al carrito
        </button>`;
    }

    contenedor.innerHTML += `
        <div class="card">
            <img src="../IMAGENES/${p.imagen}">
            <h4>${p.nombre}</h4>
            <span>$${p.precio}</span>
            <p>Stock: ${p.stock}</p>
            ${boton}
        </div>
    `;
});

});

// 🛒 AGREGAR AL CARRITO
function agregarCarrito(id) {

    let carrito = JSON.parse(localStorage.getItem("listaDeseos")) || [];

    id = Number(id);

    const producto = productosGlobal.find(p => Number(p.id_producto) == id);

    if (!producto) {
        alert("Producto no encontrado");
        return;
    }

    const existe = carrito.find(p => Number(p.id) == id);

    if (existe) {
        existe.cantidad += 1;
    } else {
        carrito.push({
            id: Number(producto.id_producto),
            nombre: producto.nombre,
            precio: Number(producto.precio),
            imagen: producto.imagen,
            cantidad: 1
        });
    }

    localStorage.setItem("listaDeseos", JSON.stringify(carrito));

    alert("🛒 Producto agregado");
}