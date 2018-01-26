<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<title>Registro</title>
</head>
<body style="background:#4f1f91;">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="./index.php">Inicio <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>
 <center><img src="./img/logo.png" alt="Logo" width="300" height="150" ></center><br>
	<div class="container col-4">
		<div class="row justify-content-center" style="background:#F2F3F4; border-radius: 8px;">
			<form class="">
			  <div class="form-group " >
			    <label for="matrcula">Matricula</label>
			    <input type="text" class="form-control" id="matricula" placeholder="Matricula">
			  </div>
			  <div class="form-group">
			    <label for="password">Contraseña</label>
			    <input type="password" class="form-control" id="password" placeholder="Contraseña">
			  </div>
			  <div class="form-group">
			    <label for="nombre">Nombre</label>
			    <input type="text" class="form-control" id="nombre" placeholder="Nombre">
			  </div>
			  <div class="form-group">
			    <label for="correo">Correo</label>
			    <input type="text" class="form-control" id="correo" placeholder="Correo">
			  </div>
				<div class="row justify-content-center">
					<button type="submit" class="btn btn-success" onclick="registrar()">Registrar</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<script>
	function registrar(){
			var xhr = new XMLHttpRequest();
  		var url = 'http://localhost/YouUpemor/controllers/registroUsuario.php';
  		xhr.open('POST',url,true);

  		var data = new FormData();
  		var matricula = document.querySelector('#matricula').value;
  		var password = document.querySelector('#password').value;
  		var nombre = document.querySelector('#nombre').value;
			var correo = document.querySelector('#correo').value;

  		data.append('matricula', matricula);
  		data.append('password', password);
			data.append('nombre', nombre);
			data.append('correo', correo);
  		data.append('action', "registroUsuario");

  		xhr.addEventListener('loadend',function(){
  		alert("Operación realizada con exito");
      document.querySelector("#matricula").value = "";
      document.querySelector("#password").value = "";
			document.querySelector("#nombre").value = "";
			document.querySelector("#correo").value = "";
  		});
  	xhr.send(data);
	}
</script>
