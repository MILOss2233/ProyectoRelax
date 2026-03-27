function cambiarPassword(){

    const usuario = document.getElementById("usuario").value.trim();
    const nueva = document.getElementById("nueva").value.trim();

    if(usuario === "" || nueva === ""){
        alert("Completa todos los campos");
        return;
    }

    fetch("../PROGRAMAS/cambiar_pass.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/x-www-form-urlencoded"
        },
        body:`usuario=${encodeURIComponent(usuario)}&nueva=${encodeURIComponent(nueva)}`
    })
    .then(res=>res.json())
    .then(data=>{

        if(data.estado === "ok"){
            alert("Contraseña actualizada correctamente");
            window.location.href = "../HTML/login.html";
        }else{
            alert(data.mensaje || "Error");
        }

    })
    .catch(()=>{
        alert("Error del servidor");
    });

}