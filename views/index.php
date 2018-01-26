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
        <a class="nav-link" href="./registroUsuario.php">Registrar <span class="sr-only">(current)</span></a>
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
				<div class="row justify-content-center">
					<button type="submit" class="btn btn-success" onclick="inicio()">Iniciar Sesión</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<script>
	function inicio(){
			var xhr = new XMLHttpRequest();
  		var url = 'http://localhost/YouUpemor/controllers/registroUsuario.php';
  		xhr.open('POST',url,true);

  		var data = new FormData();
  		var matricula = document.querySelector('#matricula').value;
  		var password = document.querySelector('#password').value;

  		data.append('matricula', matricula);
  		data.append('password', password);
  		data.append('action', "index");

  		xhr.addEventListener('loadend',function(){
  		alert("Operación realizada con exito");
      document.querySelector("#matricula").value = "";
      document.querySelector("#password").value = "";
  		});
  	xhr.send(data);
	}
</script>
