<?php
class Participant
{
    private $id;
    private $idEquipe;
    private $nom;
    private $prenom;
    private $photo;
    private $mail;
    private $role;
    private $bioFr;
    private $bioEn;
    
    public function __construct($id, $idEquipe, $nom, $prenom, $photo, $mail, $role, $bioFr, $bioEn)
    {
        $this->id = $id;
        $this->idEquipe = $idEquipe;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->photo = $photo;
        $this->mail = $mail;
        $this->role = $role;
        $this->bioFr = $bioFr;
        $this->bioEn = $bioEn;
    }
    
    function getId()
    {
        return $this->id;
    }
    
    function getIdEquipe()
    {
        return $this->idEquipe;
    }
    
    function getNom()
    {
        return $this->nom;
    }
    
    function getPrenom()
    {
        return $this->prenom;
    }
    
    function getPhoto()
    {
        return $this->photo;
    }
    
    function getMail()
    {
        return $this->mail;
    }
    
    function getRole()
    {
        return $this->role;
    }
    
    function getBioFr()
    {
        return $this->bioFr;
    }
    
    function getBioEn()
    {
        return $this->bioEn;
    }
}
?>