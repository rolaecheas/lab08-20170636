<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<header> 
		<li> <a href="/" class="btn btn-red">Inicio</a>
			<p> <li><a href="/role"class="btn btn-blue"  >REGISTRO DE ROLES</a></p>
		
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<form id="form1" class="form-horizontal" action="/role/insertar"
					method="POST">

					<h1>Insertar Rol</h1>
					<div class="form-group">
						<p> <label > <h3> Nombre del Rol</h32></label></p>
						<div class="col-sm-9">
							<input class="form-control"  autofocus name="nombre"  
								type="text" required=""><br><br><br>
						</div>
					</div>
					
					<div class="text-right">
						<button class="btn btn-green" id="enviar" type="submit">Listo</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>