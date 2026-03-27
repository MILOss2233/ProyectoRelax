function mostrar(panel){
    document.querySelectorAll(".panel").forEach(p=>p.classList.add("hidden"));
    document.getElementById(panel).classList.remove("hidden");

    if(panel === "kardex"){
        cargarKardex();
    }
    if(panel === "pedidos"){
        cargarPedidos();
    }
}

/* ================= DASHBOARD ================= */
fetch("../PROGRAMAS/admin_datos.php")
.then(r=>r.json())
.then(data=>{

    ventas.textContent = "$" + (data.ventas || 0);
usuarios.textContent =
    "Total: " + (data.usuarios || 0) +
    " | 🟢 Activos: " + (data.usuarios_activos || 0) +
    " | 🔴 Inactivos: " + (data.usuarios_inactivos || 0);
    activos.textContent = data.activos || 0;

    /* TOP PRODUCTOS */
    const topContainer = document.getElementById("top");
    topContainer.innerHTML = "";

    if (!data.top5 || data.top5.length === 0) {
        topContainer.innerHTML = "<p>No hay datos</p>";
    } else {
        data.top5.forEach((p,i)=>{
            topContainer.innerHTML += `
                <li style="display:flex;justify-content:space-between;">
                    <span>${p.nombre}</span>
                    <b>${p.total}</b>
                </li>
            `;
        });
    }

    /* GRAFICA */
    new Chart(chartIngresos,{
        type:"line",
        data:{
            labels:data.grafica.map(g=>g.fecha),
            datasets:[{
                label:"Ingresos",
                data:data.grafica.map(g=>g.total)
            }]
        }
    });

    /* ÚLTIMOS PEDIDOS */
    ultimosPedidos.innerHTML = "";
    data.ultimos.forEach(p=>{
        ultimosPedidos.innerHTML += `
        <div>
            Pedido #${p.id_pedido} - $${p.total} - ${p.estado}
        </div>`;
    });

});

/* ================= PRODUCTOS ================= */
function cargarProductos(){
fetch("../PROGRAMAS/admin_productos.php")
.then(r=>r.json())
.then(data=>{
listaProductos.innerHTML="";

data.forEach(p=>{

listaProductos.innerHTML+=`
<div>
<img src="../IMAGENES/${p.imagen}" width="80">
${p.nombre} - $${p.precio} - Stock: ${p.stock}

<div>
<button onclick="editar(${p.id_producto},${p.precio},${p.stock})">✏️</button>
<button onclick="entradaStock(${p.id_producto})">📥</button>

<button onclick="cambiarEstadoProducto(${p.id_producto}, ${p.activo})">
    ${p.activo == 1 ? "🔴 Desactivar" : "🟢 Activar"}
</button>

</div>
</div>
`;

});
});
}
cargarProductos();

/* ================= AGREGAR ================= */
function agregarProducto(){
let f=new FormData();
f.append("nombre",nombre.value);
f.append("precio",precio.value);
f.append("stock",stock.value);
f.append("imagen",imagen.files[0]);

fetch("../PROGRAMAS/admin_productos.php",{method:"POST",body:f})
.then(()=>{
    alert("Producto agregado");
    cargarProductos();
});
}

/* ================= EDITAR ================= */
function editar(id,precioActual,stockActual){

    let nuevoPrecio = prompt("Nuevo precio:", precioActual);
    if(nuevoPrecio === null) return;

    let nuevoStock = prompt("Nuevo stock:", stockActual);
    if(nuevoStock === null) return;

    fetch("../PROGRAMAS/admin_productos.php",{
        method:"PUT",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            id:id,
            precio:nuevoPrecio,
            stock:nuevoStock
        })
    })
    .then(()=> {
        alert("Producto actualizado");
        cargarProductos();
    });
}

/* ================= ACTIVAR / DESACTIVAR ================= */
function cambiarEstadoProducto(id, activo){

    let nuevo = activo == 1 ? 0 : 1;

    fetch("../PROGRAMAS/admin_productos.php",{
        method:"PUT",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            id:id,
            activo:nuevo
        })
    })
    .then(()=> {
        alert("Estado actualizado");
        cargarProductos();
    });
}

/* ================= ENTRADA STOCK ================= */
function entradaStock(id){

    let cantidad = prompt("Cantidad:");
    if(!cantidad) return;

    let costo = prompt("Costo unitario:");
    if(!costo) return;

    let fecha = prompt("Fecha (YYYY-MM-DD):");
    if(!fecha) return;

    fetch("../PROGRAMAS/admin_entrada_stock.php",{
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            id:id,
            cantidad:cantidad,
            precio:costo,
            fecha:fecha
        })
    })
    .then(res=>res.json())
    .then(data=>{
        if(data.estado === "ok"){
            alert("Entrada registrada");
            cargarProductos();
        }else{
            alert("Error");
        }
    });
}
/* ================= PEDIDOS ================= */
function cargarPedidos(){
    fetch("../PROGRAMAS/admin_pedidos.php")
    .then(r=>r.json())
    .then(data=>{

        listaPedidos.innerHTML = "";

        data.forEach(p=>{
            listaPedidos.innerHTML += `
            <div style="border:1px solid #ccc; margin:10px; padding:10px;">
                <b>Pedido #${p.id_pedido}</b><br>
                Usuario: ${p.id_usuario}<br>
                Total: $${p.total}<br>
                Estado: ${p.estado}<br>

                <button onclick="cambiarEstado(${p.id_pedido})">
                    Cambiar estado
                </button>
            </div>
            `;
        });

    })
    .catch(error=>{
        console.error("Error cargando pedidos:", error);
    });
}

/* CAMBIAR ESTADO */
function cambiarEstado(id){

    let estado = prompt("Nuevo estado: pendiente / enviado / entregado");

    if(!estado) return;

    fetch("../PROGRAMAS/admin_pedidos.php",{
        method:"PUT",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            id:id,
            estado:estado
        })
    })
    .then(()=> {
        alert("Estado actualizado");
        cargarPedidos();
    });
}

/* VER DETALLE */
function verDetalle(id){
fetch("../PROGRAMAS/admin_detalle_pedido.php?id="+id)
.then(r=>r.json())
.then(d=>{
let t="";
d.forEach(p=>t+=p.nombre+" x"+p.cantidad+"\n");
alert(t);
});
}

/* ================= KARDEX ================= */
function cargarKardex(){
fetch("../PROGRAMAS/admin_kardex.php")
.then(r=>r.json())
.then(data=>{
tablaKardex.innerHTML="";

data.forEach(k=>{
tablaKardex.innerHTML+=`
<tr>
<td>${k.producto}</td>
<td>${k.referencia}</td>

<td>${k.entrada_cantidad||0}</td>
<td>$${k.entrada_costo||0}</td>
<td>$${k.entrada_total||0}</td>

<td>${k.salida_cantidad||0}</td>
<td>$${k.salida_costo||0}</td>
<td>$${k.salida_total||0}</td>

<td>${k.saldo_cantidad}</td>
<td>$${k.saldo_costo}</td>
<td>$${k.saldo_total}</td>

<td>${k.cliente}</td>
<td>${k.fecha}</td>
</tr>
`;
});
});
}

/* ================= LOGOUT ================= */
function logout(){
fetch("../PROGRAMAS/logout.php")
.then(()=>location.href="../HTML/index.html");
}