<?php
class Model{
	protected  	$connection;
	protected  	$dbMapArray;
	protected 	$schema ;
	protected  	$table ;	
	protected  	$id= array(); 
	protected  	$PK= array();
	protected	$rech= array(); 
	
	public    	$data ;
	
	function __construct() 
	{
		
		try 
		{
			$this->schema = 'venteposters';
			$dns = 'mysql:host=127.0.0.1;dbname='.$this->schema;
			$utilisateur = "root";
			$motDePasse = '';


		  // Options de connection
			$options = array(
				PDO::MYSQL_ATTR_INIT_COMMAND    => "SET NAMES utf8"
				);

		  // Initialisation de la connection
			$this->connection = new PDO( $dns, $utilisateur, $motDePasse, $options );


		} 
		catch ( Exception $e ) 
		{
			echo "Connection à MySQL impossible : ", $e->getMessage();
			die();
		}
		
	}

	static function load($name)
	{
		require_once ('../model/'.$name.'.php');
		return new $name($name);
	}
	
	public function read($fields=null,$prech=null)//$prech à la place de $where
	{
		
		if($fields==null){
			$fields = '*';
		}
		
		if ($prech==null)
		{
			if (count($this->id) == 0)
			{
				$sql='SELECT '.$fields.' from '.$this->table;
			}
			else
			{
				$sql='SELECT '.$fields.' from '.$this->table.' where ';
				$sql.= $this->PK[0].'='.$this->connection->quote($this->id[0]);
			}
		}
		else
		{
			$prech="";
			$i=0;

			while($i<count($this->rech))
			{
				if($i==0)
				{
					$prech="upper(concat(";
				}
				else
				{
					$prech.=" , '|' , ";
				}
				$prech.=$this->rech[$i];
				$i++;
			}

			if($prech!="")
			{
				$prech.=" )) like upper(".$this->connection->quote("%".$prech."%").") ";
				$sql= 'SELECT '.$fields.' from '.$this->table.' where '.$prech; 
			}
			else
			{
				$sql= 'SELECT '.$fields.' from '.$this->table;
			}
		}

		try
		{
			//Envoi de la requête
			$select = $this->connection->query($sql);

			//Indication de l'utilisation des résultats en tant qu'objet
			$select->setFetchMode(PDO::FETCH_OBJ);
			$this->data = new stdClass();
			$this->data = $select->fetchAll();
		}
		catch (Exception $e)
		{
			echo 'Une erreur est survenue lors de la récupération des créateurs';
		}
	}
		/*if (count($this->id) == 0){
			$sql= 'SELECT '.$fields.' from '.$this->table ;
		}
		else{
			$sql= 'SELECT '.$fields.' from '.$this->table .'  where ';
			$sql.= $this->PK[0] .'='. $this->connection->quote($this->id[0]);
		}
		
		try {
		  // On envois la requète
			echo $sql;
			$select = $this->connection->query($sql);
			
		  // On indique que nous utiliserons les résultats en tant qu'objet
			$select->setFetchMode(PDO::FETCH_OBJ);
			$this->data = new stdClass();
			$this->data = $select->fetchAll();

		} catch ( Exception $e ) {
			echo 'Une erreur est survenue lors de la récupération des créateurs';
		}
		
	}*/
	
	


}
?>