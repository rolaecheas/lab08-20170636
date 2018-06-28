<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insertar Acceso</title>
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
	
	<li><a href="/" class="btn btn-red">Inicio</a>
	<li><a href="/recurso"class="btn btn-blue">Registro de Recursos</a>
		<form id="form1" class="form-horizontal" action="/recurso/insertar"
					method="POST">
					<H1>Insertar Recurso</H1>
					<div class="form-group">
						<p><label class="text-info col-sm-3 control-label"><h2>URL de Recurso</h2></label></p>
						<p><div class="col-sm-9">
							<p><input class="form-control"
								placeholder="Ingrese URL del Recurso " autofocus name="url"
								type="text" required></p>
						</div></p>
					</div>
					<div class="text-right">
						<p><button class="btn btn-green" id="enviar" type="submit">Insertar Recurso</button> </p>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>