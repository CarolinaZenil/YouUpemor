<?php
  require_once 'Database.php';
  /**
   *
   */
  class registroUsuario
  {
    public $matricula;
    public $password;
    public $nombre;
    public $correo;

    public function __construct($matricula, $password, $nombre, $correo)
  	{
  		$this->matricula = $matricula;
  		$this->password = $password;
      $this->nombre = $nombre;
      $this->correo = $correo;
  }

  public static function get(){
    $sql = "SELECT
          *
         FROM
        alumno";
    $db = new Database();
    if ($rows = $db->query($sql)) {
      $db->close();
      return $rows;
    }
    $db->close();
    return false;
  }

  public function registrar(){
    $sql = "INSERT INTO
              alumno
            VALUES('$this->matricula', '$this->password', '$this->nombre', '$this->correo',1)";
    $db = new Database();
    if ($db->query($sql)) {
			$db->close();
		} else {
			echo "Error: " . $sql . "<br>" . $db->error;
			$db->close();
		}
  }
}


?>
