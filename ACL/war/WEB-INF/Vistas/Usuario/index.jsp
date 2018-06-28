<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuario.Usuario"%>
<%@page import="modelo.role.Role"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/estilos/boton.css">
<link rel="stylesheet" href="/estilos/tabla.css">
<link rel="stylesheet" href="/estilos/formulario1.css">


</head>
<body>
	
		<P><li><a href="/" class="btn btn-red">Inicio </a></P>
		<li><a href="/usuario/insertar"class="btn btn-green">Insertar</a></li>
		<h4>
			<b>Registro de Datos de Usuarios</b>
		</h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Email</th>
					<th>Rol</th>
					<th>Estado</th>

				</tr>
				<% 
					List<Usuario> array = (List<Usuario>)request.getAttribute("array");
					List<Role> arrayRole = (List<Role>)request.getAttribute("arrayRol");
 					if(array.size() > 0) {	
 						int i = 0;
 						Role rol;
						for(Usuario usuario:array){
						 rol = arrayRole.get(i);
				%>
				<tr>
					<td><%= usuario.getNombre() %></td>
					<td><%= usuario.getApellido() %></td>
					<td><%= usuario.getEmail() %></td>
					<td><%= rol.getNombre() %></td>
					<td><%= usuario.getEstadoDescripcion()%></td>

					<td class='btn btn-group'><a
						href="/usuario/modificar?codigo=<%= usuario.getCodigo() %>"
						class="btn btn-primary btn-sm">Modificar</a> <a
						href="/usuario/eliminar?codigo=<%= usuario.getCodigo() %>"
						class="btn btn-danger btn-sm">Eliminar</a></td>
				</tr>
				<% i++;}
				} %>

			</table>
			<div class="text-center">
				<p> <a href="/usuario" class="btn btn-green">Actualizar</a> <br></p>
			</div>

		</div>

	</div>
</body>
</html>