<?php
class employees extends Model{
	var $table = "employees";	
	var $id ;
	var $PK=array("EmployeeID");
	var $rech=array("Nom","Prenom");
	var $data ; 
}

?>