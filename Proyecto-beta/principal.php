<!DOCTYPE html>
<html>
<head>
	<title>Blog Personal</title>
	<script src="jquery-3.1.1.js" type="text/javascript"></script>  
	<link rel="stylesheet" type="text/css" href="blog_css.css"> 
	<style type="text/css">
		div{
			margin: 0px auto;
		}
	</style>

</head>
<body>
		<?php 
			$conexion=mysqli_connect("localhost","root","jallmay1995","blog");
			mysqli_set_charset($conexion,"utf8");
			if(mysqli_connect_errno()){
				echo "Error de CONEXION con la BBDD";
				exit();
			}
		?>
 		<div id="cabeza">
			<div id="logo">
				<img src="logo.png">
				<h1>Tuto Informático</h1>
			</div>
			<div id="login">
			<?php if(!empty($_POST['user'])): ?>

				<div id="user">
				<?php 

					$consulta="SELECT Alias, Contraseña FROM USUARIOS WHERE Alias='".$_POST['user']."';";
					$resultado=mysqli_query($conexion,$consulta);
					$fila=mysqli_fetch_array($resultado);
					if(!is_null($fila)){
						if($fila['Alias']==$_POST['user'] && $fila['Contraseña']==md5($_POST['pass'])){
							echo "<img id='avatar' src='user.png'><br>";
							echo "<span>Bienvenido</span> <a href='principal.php'>".$_POST['user']."</a>";
						}else {
							echo "Usuario o Contraseña incorrecta";
						}
					}else {
						echo "El Usuario no existe";
					}

				 ?>
				 </span>
				 </div>
			<?php else: ?>
				<form method="post">
					<span>Usuario:</span>
        			<input type="text" name="user" required>
        			<br>
    				<span>Contraseña:</span>
    				<input type="password" name="pass" required>
    				<br>
    				<a style="font-size:15px; margin-left: 75px;" href="http://localhost/Proyecto-beta/registro.php">Registrate</a>
    				<input type="submit" name="sesion" value="Iniciar Sesión">
				</form>
			<?php endif ?>
				
			</div>
		</div>
		<div id="categorias">
			<ul>
				<a href=""><li>Windows</li></a>
				<a href=""><li>GNU/Linux</li></a>
				<a href=""><li>Raspberry</li></a>
				<a href=""><li>Android</li></a>
				<a href=""><li>PC'S</li></a>
			</ul>

		</div>
		<div id="entrada">
				<div></div>
				<div></div>
				<div></div>
		</div>
		<div id="pie"></div>
</body>
</html>