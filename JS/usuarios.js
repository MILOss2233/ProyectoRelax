let productos = [
    {
        nombre: "Cobija Premium",
        desc: "Ultra suave y térmica",
        precio: "$120.000",
        img: "img/cobija.jpg"
    },
    {
        nombre: "Almohada Memory Foam",
        desc: "Descanso ergonómico",
        precio: "$110.000",
        img: "img/almohada2.jpg"
    }
];

let index = 0;

function mover(direccion) {
    index = (index + direccion + productos.length) % productos.length;
    document.querySelector(".producto-activo img").src = productos[index].img;
    document.querySelector(".producto-activo h3").textContent = productos[index].nombre;
    document.querySelector(".producto-activo p").textContent = productos[index].desc;
    document.querySelector(".producto-activo span").textContent = productos[index].precio;
}
