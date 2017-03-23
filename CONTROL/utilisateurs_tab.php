<?php
	require_once('../control/core.php');
	require_once('../vue/haut.php');
	require_once('../vue/aside.php');
	
	$rech="";

	if (isset($_POST['RECHERCHE']))
	{
		$rech=$_POST['RECHERCHE'];
	}
	
	$utilisateurs=Model::load("utilisateurs");

	$utilisateurs->read();

	require_once('../vue/utilisateurs_tab.php');

	require_once('../vue/bas.php');
?>