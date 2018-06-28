<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.role.Role"%>
<%@page import="modelo.recurso.Recurso"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Generar Acceso</title>
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
</head>
<body>

		<p><li><a href="/" class="btn btn-red">Inicio</a></p>
		<li><a href="/acceso"class="btn btn-blue">Registro</a>
	<%
		List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
		List<Recurso> arrayRecurso = (List<Recurso>) request.getAttribute("arrayRecurso");
	%>
				<form id="form1" class="form-horizontal" action="/acceso/insertar"
					method="POST">
					<h1>Insertar Acceso</h1>
					<div class="form-group">
						<p><label class="text-info col-sm-3 control-label">Role</label></p>
						<div class="col-sm-9">
							<select class="form-control" name="role">
								<% if(arrayRole.size() > 0){ 
									for(Role rol : arrayRole){
									%>
								<option value=<%=rol.getId() %>><%=rol.getNombre() %></option>

								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<p><label class="text-info col-sm-3 control-label">Recurso</label></p>
						<div class="col-sm-9">
							<select class="form-control" name="recurso">
								<% if(arrayRecurso.size() > 0){ 
									for(Recurso recurso : arrayRecurso){
									%>
								<option value=<%=recurso.getId() %>><%=recurso.getUrl() %></option>
								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<p><button class="btn btn-green" id="enviar" type="submit">Listo</button></p>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>