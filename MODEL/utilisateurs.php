<?php
class utilisateurs extends Model{
	var $table = "utilisateurs";	
	var $id ;
	var $PK=array("utilisateur");
	var $rech=array("utilisateur","nom","prenom");
	var $data ; 
}

?>