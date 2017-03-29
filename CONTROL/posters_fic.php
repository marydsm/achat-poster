<?php
	require_once('../control/core.php');
	require_once('../vue/haut.php');
	require_once('../vue/aside.php');

	$posters=Model::load("posters");
	$posters->id[0]=$_POST['id'];
	$posters->read('posterID "ID Poster", titre "Titre", auteur "Auteur", prix_unitaire "Prix unitaire", lienposter "Lien", actif "Actif"');
	echo $posters->rtv_fiche();

	require_once('../vue/bas.php');
?>
