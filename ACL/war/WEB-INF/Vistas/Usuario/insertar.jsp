<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="modelo.role.Role"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/estilos/formulario1.css">
	<link rel="stylesheet" href="/estilos/boton.css">

</head>
<body>

	<p><li><a href="/"  class="btn btn-red" >Inicio </a></p>
	<li><a href="/usuario" class="btn btn-green" >Registro de Datos</a>
		
				<form id="form1" class="form-horizontal" action="/usuario/insertar"
					method="POST">
					<h1>Insertar Usuario</h1>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input class="form-control"
							 autofocus name="nombre"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<p><label class="text-info col-sm-2 control-label">Apellido</label></p>
						<div class="col-sm-10">
							<input class="form-control"
						 name="apellido"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<p><label class="col-sm-2 control-label text-info">Email</label></p>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon"></div>
								<p><input class="form-control"
									name="email"
									type="email" required></p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<p><label class="text-info col-sm-2 control-label">Rol</label></p>
						<div class="col-sm-10">
							<%
							List<Role> array = (List<Role>)request.getAttribute("array");
							if(array != null && array.size() > 0){
							%>
							<select class="form-control" name="idRol">
								<% for(Role rol : array) {%>
								<option value= <%=rol.getId() %>><%=rol.getNombre()%></option>
								<%} %>
							</select>
							<% }%>
						</div>
					</div>
					<div class="text-right">
						<p><button class="btn btn-green" id="enviar" type="submit">Insertar
							Usuario</button></p>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>