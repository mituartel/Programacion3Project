window.onload = main;

function main() {
    var tipoDeUsuario = localStorage.getItem("tipoDeUsuario");

    if(tipoDeUsuario == 1)
    {
        var URL="bienvenido.html";
        this.location.href=URL;
    }
    else
    {
        var URL="bienvenidoUsser.html";
        this.location.href=URL;
    }
}