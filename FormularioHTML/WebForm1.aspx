<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FormularioHTML.WebForm1" %>
<!DOCTYPE html>
<html>
<head>
    <title> Registro</title>
    <script type="text/javascript">

        function validar() {

            var nombre = document.getElementById("nombre").value;
            var apellido = document.getElementById("apellido").value;
            var email = document.getElementById("email").value;
            var M = document.getElementById("M").checked;
            var F = document.getElementById("F").checked;
            var ciudad = document.getElementById("ciudad").value;

            var valnombre = /^[a-zA-Z\s]{1,40}$/;
            var valapellido = /^[a-zA-Z]{1,20}$/;
            var valemail = /^[a-zA-Z0-9_.+-]+@unsa.edu.pe$/;

            if (!valnombre.test(nombre)) {
                alert("Error en Nombre");
                return false;
            }

            if (!valapellido.test(apellido)) {
                alert("Error en Apellidos");
                return false;
            }
            if (M == false && F == false) {
                alert("Sexo no indicado");
                return false;
            }

            if (!valemail.test(email)) {
                alert("Email incorrecto");
                return false;
            }
            if (ciudad == "") {
                alert("Seleccionar una Ciudad");
                return false;
            }

            var fechaRegistro = new Date();
            alert("Registrado a las: " + fechaRegistro);
            return false;
        }

        function limpiar_contenido() {
            var vacio = "";
            document.getElementById("nombre").value = vacio;
            document.getElementById("apellido").value = vacio;
            document.getElementById("M").checked = false
            document.getElementById("F").checked = false;
            document.getElementById("email").value = vacio;
            document.getElementById("direccion").value = vacio;
            document.getElementById("ciudad").value = vacio;
            document.getElementById("requerimiento").value = vacio;
            return false;
        }

    </script>
</head>
<body>
    <header>
        <h1>Registro de Alumnos: </h1>
    </header>
    <form runat="server" method="GET" id="formulario">

        <!--control tipo texto-->
        Nombre: <input type="text" id="nombre" maxlength="50"><br><br />

        Apellido: <input type="text" id="apellido" maxlength="50"><br><br>

        <!--opcion excluyente-->
        Sexo: <input type="radio" id="M" name="sexo" value="Varon"> Varon
        <input type="radio" id="F" name="sexo" value="Mujer"> Mujer <br><br>

        <!--control tipo texto-->
        e-mail: <input type="text" id="email"><br><br>

        <!--control tipo texto-->
        Direccion: <input type="text" id="direccion"><br><br>

        <!--lista desplegable-->
        <label for="ciudad">Ciudad: </label>
        <select id="ciudad" name="ciudad">
            <option value="arequipa">Arequipa</option>
            <option value="cusco">Cuzco</option>
            <option value="lima">Lima</option>
            <option value="puno">Puno</option>
        </select> <br><br>

        <!--area de texto multilinea-->
        Requerimiento: <br />
        <textarea id="requerimiento" name="message" rows="10" cols="30"></textarea><br><br>

        <!--boton de limpiar-->
        <asp:Button ID="button1" runat="server" Text="Limpiar" OnClientClick="return limpiar_contenido();"/>

        <!--boton de envio-->
        <asp:Button id="button2" runat="server" Text="Enviar" OnClientClick="return validar();"/>
</form>
</body>
</html>