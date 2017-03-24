<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Achats Posters</title>
	<link rel="stylesheet" href="../vue/css/page.css">

</head>
<body>
	<header id="header" class="header">
		<H1>
			Projet de développement web : Travail de groupe <br>
			Achat de posters grands formats<br>
		</H1>
		<?php 
		if(isset($_SESSION['NOM'])){ 
			echo 'Bonjour Mr. '.$_SESSION['NOM'];
		} 
		if (Control::user_connected()){
			require_once('../vue/menu.php');
		}
		?>
	</header>
