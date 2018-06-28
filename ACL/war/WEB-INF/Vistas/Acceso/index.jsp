<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modelo.acceso.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/estilos/boton.css">
<link rel="stylesheet" href="/estilos/tabla.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Acceso</title>




</script>
<style>
.titulo {
	/*color:inherit;*/
	color: inherit;
	margin-bottom: 20px;
}

.alert {
	padding: 10px;
}
</style>
</head>
<body>

		<p><li><a href="/" class="btn btn-red">Inicio </a></p>
		<li><a href="/acceso/insertar"class="btn btn-blue">Insertar Accesos</a></li>
	<br>
	<!--TABLA -->
	<div class="container">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo Acceso</th>
					<th>Role</th>
					<th>Recurso</th>
					<th>Estado</th>
					<th></th>
				</tr>
				<% 
					List<AccesoAux> array = (List<AccesoAux>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(AccesoAux accesoAux:array){
				%>
				<tr>
					<td><%= accesoAux.getId() %></td>
					<td><%= accesoAux.getRole() %></td>
					<td><%= accesoAux.getRecurso() %></td>
					<td><%= accesoAux.estadoDescripcion() %></td>

					<td class='btn btn-group'>
						<a href="/acceso/modificar?id=<%= accesoAux.getId() %>" class="btn btn-green">Modificar</a> 
						<a href="/acceso/eliminar?id=<%= accesoAux.getId() %>" class="btn btn-red">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div class="text-center">
			<p><a href="/acceso" class="btn btn-green">Actualizar</a></p>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>