<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.usuario.*"%>
<%@ page import="modelo.role.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar Usuario</title>
	<link rel="stylesheet" href="/estilos/formulario1.css">
	<link rel="stylesheet" href="/estilos/boton.css">

</head>
<body>
	<%
		Usuario usuario = (Usuario) request.getAttribute("usuario");
		List<Role> array = (List<Role>) request.getAttribute("array");
	%>
	
		<li><a href="/"  class="btn btn-red" >Inicio </a>
		<li><a href="/usuario/insertar" class="btn btn-green" >Insertar</a></li>
		<li><a href="/usuario" class="btn btn-blue" >Registro de datos</a>
		<li class="active"><a href="/usuario/modificar?id=<%=usuario.getCodigo()%>" class="btn btn-blue" >Modificar</a>
		</ul>
				<form id="form1" class="form-horizontal" action="/usuario/modificar"
					method="POST">
					<p><h1>Modificar Datos</h1></
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" hidden name="codigo"
								value=<%=usuario.getCodigo()%>> <input
								class="form-control" placeholder="Nombre del Usuario"
								name="nombre" type="text" required=""
								value="<%=usuario.getNombre()%>">
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control" placeholder="Apellido del Usuario"
								name="apellido" required type="text"
								value="<%=usuario.getApellido()%>">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label text-danger">Email</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control" placeholder="Gmail Usuario"
									name="email" type="email" value="<%=usuario.getEmail()%>">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Rol</label>
						<div class="col-sm-10">
							<%
								if (array != null && array.size() > 0) {
							%>
							<select class="form-control" name="idRol">
								<%
									for (Role role : array) {
											if (role.getId().equals(usuario.getCodigo())) {
								%>

								<option value="<%=role.getId()%>" selected><%=role.getNombre()%></option>
								<%
									} else {
								%>
								<option value="<%=role.getId()%>"><%=role.getNombre()%></option>
								<%
									}
										}
								%>
							</select>
							<%
								}
							%>
						</div>
					</div>

					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<%
									if (!usuario.isEstado()) {
								%>
								<option <%="selected"%> value="false">INACTIVO</option>
								<%
									} else {
								%>
								<option value="false">INACTIVO</option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/usuario" class="btn btn-danger">CANCELAR</a>
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