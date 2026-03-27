<?php
session_start();
if (!isset($_SESSION['rol']) || $_SESSION['rol'] != 1) {
    header("Location: ../HTML/index.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet" href="../CSS/admin.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="layout">

<!-- SIDEBAR -->
<aside class="sidebar">
    <h2>🛏️ Admin</h2>

    <button onclick="mostrar('dashboard')">📊 Dashboard</button>
    <button onclick="mostrar('productos')">📦 Productos</button>
    <button onclick="mostrar('pedidos')">🧾 Pedidos</button>
    <button onclick="mostrar('kardex')">📊 Kardex</button>

    <button class="logout" onclick="logout()">Cerrar sesión</button>
</aside>

<!-- MAIN -->
<main class="main">

<!-- DASHBOARD -->
<section id="dashboard" class="panel">
<h1>Dashboard</h1>

<div class="cards">
<div class="card"><h3>Ventas</h3><p id="ventas"></p></div>
<div class="card"><h3>Usuarios</h3><p id="usuarios"></p></div>
<div class="card"><h3>🟢Productos activos</h3><p id="activos"></p></div>
</div>

<div class="grid-2">
<div class="card">
<h3>Ingresos</h3>
<canvas id="chartIngresos"></canvas>
</div>

<div class="card">
<h3>Top productos</h3>
<ul id="top"></ul>
</div>
</div>

<div class="card">
<h3>Últimos pedidos</h3>
<div id="ultimosPedidos"></div>
</div>

</section>

<!-- PRODUCTOS -->
<section id="productos" class="panel hidden">
<h1>Productos</h1>

<div class="form">
<input id="nombre" placeholder="Nombre">
<input id="precio" placeholder="Precio">
<input id="stock" placeholder="Stock">
<input type="file" id="imagen">
<button onclick="agregarProducto()">Agregar</button>
</div>

<div id="listaProductos"></div>
</section>

<!-- PEDIDOS -->
<section id="pedidos" class="panel hidden">
<h1>Pedidos</h1>
<div id="listaPedidos"></div>
</section>

<!-- KARDEX -->
<section id="kardex" class="panel hidden">
<h1>Kardex</h1>

<div class="tabla-kardex">
<table>
<thead>
<tr>
<th>Producto</th>
<th>Ref</th>

<th>Entradas</th>
<th>Costo</th>
<th>Total</th>

<th>Salidas</th>
<th>Costo</th>
<th>Total</th>

<th>Saldo</th>
<th>Costo</th>
<th>Total</th>

<th>Cliente</th>
<th>Fecha</th>
</tr>
</thead>

<tbody id="tablaKardex"></tbody>

</table>
</div>

</section>

</main>
</div>

<script src="../JS/admin.js"></script>
</body>
</html>