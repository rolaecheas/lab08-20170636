<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.recurso.Recurso"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recursos</title>
	<link rel="stylesheet" href="/estilos/formulario1.css">
	<link rel="stylesheet" href="/estilos/boton.css">
	<link rel="stylesheet" href="/estilos/tabla.css">
	
<style>
.titulo {
	color: inherit;
	margin-bottom: 20px;
}

.alert {
	padding: 10px;
}
</style>
<script>
            $(document).ready(function(){
                $('.btn-danger').click(function(){
                    var a = confirm("Estas Seguro de Eliminar");
                    if(!a){
                        return false;
                    }
                });
                
            });
            
        </script>
</head>
<body>
	<header> 
		<p><li><a href="/" class="btn btn-red">Inicio </a></p>
		<p><li><a href="/recurso/insertar"class="btn btn-green">INSERTAR RECURSO</a></li></p>
	<br>
	<!--TABLA -->
	<div class="container">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo Recurso</th>
					<th>Recurso URL</th>
					<th>Fecha de Creacion</th>
					<th>Estado</th>
					<th></th>
				</tr>
				<% 
					List<Recurso> array = (List<Recurso>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Recurso rec:array){
				%>
				<tr>
					<td><%= rec.getId() %></td>
					<td><%= rec.getUrl() %></td>
					<td><%= rec.fechaDescripcion() %></td>
					<td><%= rec.estadoDescripcion() %></td>


					<td class='btn btn-group'><a
						href="/recurso/modificar?id=<%= rec.getId() %>"
						class="btn btn-blue">Modificar</a> <a
						href="/recurso/eliminar?id=<%= rec.getId() %>"
						class="btn btn-red">Eliminar</a></td>
				</tr>
				<% }
				} %>

			</table>
			<div class="text-center">
				<p> <a href="/recurso" class="btn btn-green">ACTUALIZAR</a> <br> </p>
			</div>

		</div>

	</div>
</body>
</html>