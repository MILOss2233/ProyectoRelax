function pagar() {
    const tarjeta = document.getElementById("tarjeta").value;
    const fecha = document.getElementById("fecha").value;
    const cvv = document.getElementById("cvv").value;

    if (tarjeta === "" || fecha === "" || cvv === "") {
        alert("Completa todos los datos de pago");
        return;
    }

    alert("✅ Pago realizado con éxito");

    // Vaciar lista de deseos
    localStorage.removeItem("listaDeseos");

    // Redirigir a factura
    window.location.href = "factura.html";
}
