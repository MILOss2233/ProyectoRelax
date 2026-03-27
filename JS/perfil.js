/* CARGAR DATOS */
fetch("../PROGRAMAS/perfil_usuario.php")
.then(res=>res.json())
.then(data=>{

    document.getElementById("nombre").value = data.nombre || "";
    document.getElementById("direccion").value = data.direccion || "";
    document.getElementById("telefono").value = data.telefono || "";

    if(data.foto){
        document.getElementById("preview").src = "../IMAGENES/" + data.foto;
    }
});

/* GUARDAR */
document.getElementById("formPerfil").addEventListener("submit", e=>{
    e.preventDefault();

    let form = new FormData();

    form.append("nombre", document.getElementById("nombre").value);
    form.append("direccion", document.getElementById("direccion").value);
    form.append("telefono", document.getElementById("telefono").value);

    const fotoInput = document.getElementById("foto");

    if(fotoInput.files.length > 0){
        form.append("foto", fotoInput.files[0]);
    }

    fetch("../PROGRAMAS/perfil_usuario.php",{
        method:"POST",
        body:form
    })
    .then(res=>res.text())
    .then(data=>{
        console.log(data);
        alert("Perfil actualizado");
        location.reload(); // 🔥 recarga para ver cambios
    });
});

/* PREVIEW IMAGEN */
document.getElementById("foto").addEventListener("change", function(){
    const file = this.files[0];
    if(file){
        document.getElementById("preview").src = URL.createObjectURL(file);
    }
});