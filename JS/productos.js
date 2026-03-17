const productos = [
    {
        id: 1,
        nombre: "Almohada Ergonómica",
        precio: 80000,
        imagen: "isranunkel-almohada-ergonomica-multiposicion__1268134_pe928636_s5.avif"
    },
    {
        id: 2,
        nombre: "Cobija Polar",
        precio: 95000,
        imagen: "7702704472673-1.webp"
    },
    {
        id: 3,
        nombre: "Almohada Memory Foam",
        precio: 110000,
        imagen: "images.jpg"
    }
];
const destacados = [
    {
        nombre: "Cobija Premium",
        descripcion: "Ultra suave, ideal para noches frías.",
        precio: "$120.000",
        imagen: "IMAGENES/WhatsApp_Image_2025-06-02_at_4.41.28_PM.webp"
    },
    {
        nombre: "Cobija Polar",
        descripcion: "Calidez y suavidad extrema.",
        precio: "$95.000",
        imagen: "IMAGENES/7702704472673-1.webp"
    },
    {
        nombre: "Almohada Memory Foam",
        descripcion: "Se adapta a tu descanso.",
        precio: "$110.000",
        imagen: "IMAGENES/images.jpg"
    }
];

let indice = 0;

function mover(direccion) {
    const contenedor = document.querySelector(".producto-activo");
    const img = contenedor.querySelector("img");
    const titulo = contenedor.querySelector("h3");
    const texto = contenedor.querySelector("p");
    const precio = contenedor.querySelector("span");

    // Animación de salida
    img.style.opacity = 0;
    img.style.transform = "translateX(-30px)";
    contenedor.querySelector(".info").style.opacity = 0;
    contenedor.querySelector(".info").style.transform = "translateX(30px)";

    setTimeout(() => {
        indice += direccion;

        if (indice < 0) indice = destacados.length - 1;
        if (indice >= destacados.length) indice = 0;

        const producto = destacados[indice];

        img.src = producto.imagen;
        titulo.textContent = producto.nombre;
        texto.textContent = producto.descripcion;
        precio.textContent = producto.precio;

        // Animación de entrada
        img.style.opacity = 1;
        img.style.transform = "translateX(0)";
        contenedor.querySelector(".info").style.opacity = 1;
        contenedor.querySelector(".info").style.transform = "translateX(0)";
    }, 300);
}
