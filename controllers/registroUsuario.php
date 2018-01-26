<?php
  include_once("../models/registroUsuario.php");

  if(isset($_POST["action"])){
    $usuario = new registroUsuario($matricula, $password, $nombre, $correo);
    $usuario->registrar();
  }else {
  	$usuario = registroUsuario::get();

  	$usuario = json_encode($usuario);

  	echo $usuario;
  }
?>
