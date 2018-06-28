<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.role.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/estilos/formulario1.css">
<link rel="stylesheet" href="/estilos/boton.css">
<style>
.titulo {	
	color: inherit;
	margin-bottom: 20px;
}

.alert {
	padding: 10px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<header> 
		<li> <a href="/"class="btn btn-red" >Inicio </a>
		<li><a href="/role/insertar"class="btn btn-green" >INSERTAR ROL</a></li>
		<li><a href="/role"class="btn btn-blue" >REGISTRO DE ROLES</a>
		
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
			<%
				Role rol = (Role)request.getAttribute("role");
				%>
				<form id="form1" class="form-horizontal" action="/role/modificar"
					method="POST">
					<h1> Modificar Rol</h1>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label"><h2>Nombre</h2></label>
						<div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rol.getId() %>>
							<input class="form-control" placeholder="Ingrese nombre Role"
								name="nombre" type="text" required=""
								value=<%= rol.getNombre() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label"><h2>Estado</h2></label>
						<p><div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rol.isEstado()) {%>
								<option <%="selected"%> value="false">INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div></p>
					</div>
					<div class="text-right">
						<a href="/role" class="btn btn-red">CANCELAR</a>
						<button class="btn btn-green" id="enviar" type="submit">MODIFICAR
							DATOS</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>