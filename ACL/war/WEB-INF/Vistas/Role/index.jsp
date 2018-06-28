<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modelo.role.Role" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/estilos/boton.css">
<link rel="stylesheet" href="/estilos/tabla.css">
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
	<header> <nav class="navbar navbar-default ">
	<div class="navbar-header">
		<!-- Id navegacion  debe coincidir con el nombre id de abajo-->

		<a href="/" class="btn btn-red" >Panel Principal </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<ul class="nav navbar-nav">
			<li><a href="/role/insertar" class="btn btn-green">Agregar Rol</a></li>
		</ul>
	</div>
	</nav> </header>

	<br>
	<!--TABLA -->
	<div class="container">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo Role</th>
					<th>Nombre</th>
					<th>Fecha de Creacion</th>
					<th>Estado</th>
					<th></th>
				</tr>
				<% 
					List<Role> array = (List<Role>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Role rol:array){
				%>
				<tr>
					<td><%= rol.getId() %></td>
					<td><%= rol.getNombre() %></td>
					<td><%= rol.fechaDescripcion() %></td>
					<td><%= rol.estadoDescripcion() %></td>


					<td class='btn btn-group'>
						<a href="/role/modificar?id=<%= rol.getId() %>"  class="btn btn-blue">Modificar</a> 
						<a href="/role/eliminar?id=<%= rol.getId() %>" class="btn btn-red">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div class="text-center">
			<p>
			<a href="/role" class="btn btn-green ">ACTUALIZAR</a> </p>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>