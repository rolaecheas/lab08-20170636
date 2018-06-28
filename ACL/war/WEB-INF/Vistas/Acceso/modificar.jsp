<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="modelo.acceso.*"%>
<%@ page import="modelo.recurso.*"%>
<%@ page import="modelo.role.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar Acceso</title>
<link rel="stylesheet" href="/estilos/formulario1.css">
<link rel="stylesheet" href="/estilos/boton.css">
</head>
<body>
	
		<a href="/" class="navbar-brand">Inicio </a>
		<li><a href="/acceso/insertar">INSERTAR ACCESO</a></li>
		<li><a href="/acceso">REGISTRO DE ACCESOS</a>
		

				<%
					Acceso acceso = (Acceso) request.getAttribute("acceso");

					List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
					List<Recurso> arrayRecurso = (List<Recurso>) request.getAttribute("arrayRecurso");
				%>
				<form id="form1" class="form-horizontal" action="/acceso/modificar"
					method="POST">
					<h1>Modificar el Acceso</h1>
					<div class="form-group">
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Role</label>
							<div class="col-sm-9">
								<input type="text" hidden name="id" value=<%=acceso.getId()%>>
								<select class="form-control" name="role">
									<%
										if (arrayRole.size() > 0) {
											for (Role rol : arrayRole) {
									 		if(rol.getId().equals(acceso.getIdRole())){
									%>
									<option value=<%=rol.getId()%> selected><%=rol.getNombre()%></option>
									<%} else { %>
									<option value=<%=rol.getId()%>><%=rol.getNombre()%></option>

									<%
										}
									}
									}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Recurso</label>
							<div class="col-sm-9">
								<select class="form-control" name="recurso">
									<%
										if (arrayRecurso.size() > 0) {
											for (Recurso recurso : arrayRecurso) {
												 if(recurso.getId().equals(acceso.getIdRecurso())){
									%>
									<option value=<%=recurso.getId()%> selected><%=recurso.getUrl()%></option>

											<% } else {%>
									<option value=<%=recurso.getId() +" "+ acceso.getIdRecurso() %>><%=recurso.getUrl()%></option>

									<%
												}
									 	}
									}
									%>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Estado</label>
							<div class="col-sm-6">
								<select class="form-control" name="estado">
									<option value="true">ACTIVO</option>
									<%
										if (!acceso.isEstado()) {
									%>
									<option <%="selected"%>>INACTIVO</option>
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
							<a href="/acceso" class="btn btn-red">CANCELAR</a>
							<p> <button class="btn btn-green" id="enviar" type="submit">MODIFICAR
								ACCESO</button></p>

						</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>