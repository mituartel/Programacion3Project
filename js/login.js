
function logClave() 
{
    if(document.getElementById("contrase").value == 1)
    {
        var URL="bienvenido.html";
        this.location.href=URL;
        localStorage.setItem("tipoDeUsuario",1);
    }
    else
    {
        alert("Clave Incorrecta");
        localStorage.setItem("tipoDeUsuario",0);
        
    }
}

function logUsuario() 
{
    var URL="bienvenidoUsser.html";
    this.location.href=URL;
    localStorage.setItem("tipoDeUsuario",0);
}