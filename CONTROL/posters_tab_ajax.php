<?php
	require_once('../control/core.php');

	if(!(isset($rech)))
	{
		$rech="";
	}

	if(isset($_POST['RECH_AJAX']))
	{
		$rech=$_POST['RECH_AJAX'];
	}

	$posters=Model::load("posters");

	$posters->read('posterID "ID Poster", titre "Titre", auteur "Auteur", prix_unitaire "Prix unitaire", lienposter "Lien", actif "Actif"', $rech);

	require_once('../vue/posters_tab.php');

	require_once('../vue/bas.php');
?>