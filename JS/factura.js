// Mostrar cliente
const usuario = localStorage.getItem("usuarioActivo");
document.getElementById("cliente").textContent = usuario || "Cliente";

// Fecha actual
const fecha = new Date().toLocaleDateString("es-CO", {
    day: "2-digit",
    month: "long",
    year: "numeric"
});
document.getElementById("fecha").textContent = fecha;

// Obtener productos comprados
const productos = JSON.parse(localStorage.getItem("listaDeseos")) || [];

const lista = document.getElementById("listaProductos");
let total = 0;

// Contar productos repetidos
const contador = {};

productos.forEach(p => {
    contador[p.nombre] = contador[p.nombre] || { ...p, cantidad: 0 };
    contador[p.nombre].cantidad++;
});

// Mostrar productos
Object.values(contador).forEach(p => {
    const subtotal = p.precio * p.cantidad;
    total += subtotal;

    const li = document.createElement("li");
    li.innerHTML = `
        <span>${p.nombre} x${p.cantidad}</span>
        <span>$${subtotal.toLocaleString("es-CO")}</span>
    `;
    lista.appendChild(li);
});

// Mostrar total
document.getElementById("total").textContent =
    `$${total.toLocaleString("es-CO")} COP`;

// Limpiar lista después de facturar
localStorage.removeItem("listaDeseos");
