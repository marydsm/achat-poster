<?php
	require_once('../control/core.php');
	require_once('../vue/haut.php');
	require_once('../vue/aside.php');

	$utilisateurs=Model::load("utilisateurs");
	$utilisateurs->id[0]=$_POST['id'];
	$utilisateurs->read('utilisateur "User", code "Pass", nom "Nom", prenom "Prénom", admin "Administrateur", actif "Actif"');
	echo $utilisateurs->rtv_fiche();

	require_once('../vue/bas.php');
?>
