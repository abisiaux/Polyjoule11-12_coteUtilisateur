<?php
class Categorie
{  
	private $id;
	private $idParent;
	private $titreFR;
	private $titreEN;
	private $descFR;
	private $descEN;
    
	public function __construct( $idCat , $idCatParent , $titreFRCat , $titreENCat, $descFR, $descEN, $albumId, $personneId, $isLivreOr )
	{
		$this->id = $idCat ;
		$this->idParent = $idCatParent ;
		$this->titreFR = $titreFRCat ;
		$this->titreEN = $titreENCat ;
		$this->descFR = $descEN;
		$this->descEN = $descEN;
        $this->albumId = $albumId;
        $this->isLivreOr = $isLivreOr;
        $this->personneId = $personneId;
	}
	
	public function getId()
	{
		return $this->id ;
	}
	
	public function getIdParent()
	{
		return $this->idParent ;
	}
	
	public function getTitre()
    {
        if($_SESSION['langue'] == 'EN')
        {
            return $this->titreEN;
        }
        else
        {
            return $this->titreFR;
        }
    
    }
	
	public function getDesc()
	{
		if( (isset($_SESSION['langue'])) && ($_SESSION['langue'] == 'FR') )
		{
			return $this->descFR;
		}
		else if( (isset($_SESSION['langue'])) && ($_SESSION['langue'] == 'FR') )
		{
			return $this->descEN;
		}
		else
		{
			// A TRAITER ??????????
		}
	}
    
    public function getUrl()
    {
        $idCat = intval($this->id); // ATTENTION DANS LE FUTUR IL FAUDRA GERER SI LA CATEGORIE RENVOIE VERS UNE LISTE DARTICLE OU VERS UNE LISTE DE NEWS !!!!
        return( "http://".$_SERVER['HTTP_HOST']."/PRESENTATION/listArticle.php?cat=".$idCat );
    }
    
    public function getAlbumId()
    {
        return $this->albumId;
    }
    
    public function getIsLivreOr()
    {
        return $this->isLivreOr;
    }
    
    public function getPersonneId()
    {
        return $this->personneId;
    }
    
    public function isLivreOr()
    {
        if($this->getIsLivreOr() == 1 )
        {
            return true ;
        }
        return false;
    }
    
    
    public function isAlbum()
    {
        if( $this->getAlbumId() != NULL )
        {
            return true;
        }
        return false;
    }
    
    
    public function isPersonne()
    {
        if( $this->getPersonneId() != NULL )
        {
            return true;
        }
        return false;
    }
	
}
?>