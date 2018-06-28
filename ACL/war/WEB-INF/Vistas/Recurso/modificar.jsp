<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.recurso.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Modificar Recurso</title>
	<link rel="stylesheet" href="/estilos/formulario1.css">
	<link rel="stylesheet" href="/estilos/boton.css">
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
<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<li><a href="/" class="btn btn-red">Inicio </a>
		<li><a href="/recurso/insertar"class="btn btn-green">INSERTAR RECURSO</a></li>
		<li><a href="/recurso"class="btn btn-blue" >REGISTRO DE RECURSOS</a>

	<div class="container">
				<%
				Recurso rec = (Recurso)request.getAttribute("recurso");
				%>
				<form id="form1" class="form-horizontal" action="/recurso/modificar"
					method="POST">
					<h1>Modificar Recurso</h1>
					<div class="form-group">
						<p><label class="text-info col-sm-2 control-label"><h2>Nombre</h2></label></p>
						<p><div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rec.getId() %>>
							<input class="form-control" placeholder="Ingrese URL del Recurso"
								name="url" type="text" required=""
								value=<%= rec.getUrl() %>>
						</div></p>
					</div>
					<div class="form-group">
						<p><label class="text-info col-sm-2 control-label"><h2>Estado</h2></label></p>
						<p><div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rec.isEstado()) {%>
								<option <%="selected"%>>INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div></p>
					</div>
					<div class="text-right">
						<a href="/recurso" class="btn btn-red">Cancelar</a>
						<button class="btn btn-green" id="enviar" type="submit">Listo
							</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>