<?php

$category = new CategorieBD();

$SuperParentCategoryID = NULL;
$SuperParentCategory = NULL;

$LinkedCategoryID = 0;
$LinkedCategory = NULL;

$SousCategories = NULL;

$html = NULL;

if( isset($_GET['numPage']) )   // Si c est le livre d or, on recherche son identifiant de categorie dans la base
{
    $_GET['cat'] = getIdRubrique();
}
if(	(isset( $_GET['article'] ) ) )
{
	$LinkedCategoryID = $category->getAsssociateCategoryIDForArticle($_GET['article']);	
}
elseif( isset( $_GET['cat'] ) )
{
	$LinkedCategoryID = $_GET['cat'];
}

$LinkedCategory = $category->getCategorieWithId($LinkedCategoryID);    

$SuperParentCategory = $category->getSuperParentCategoryOfCategory($LinkedCategoryID);

//echo "SUPERPARENT : ".$SuperParentCategory->getId()."  CAT : ".$LinkedCategory->getId();

//    print_r($LinkedCategory);




//Recup屍ation des sous cat使ories de la cat使orie SuperParent
$SousCategories = $category->getSousCategories($SuperParentCategory->getId());
    //print_r($SousCategories);
// DEBUT AFFICHAGE HTML

$html.="<ul id='menuPage'><li><h2>".$SuperParentCategory->getTitre()."</h2></li>";
foreach ($SousCategories as $_Categorie)
{
	$html.="<li";
	if( $_Categorie->getID() == $LinkedCategory->getID() )
    {
		$html.=" class='Nactive'";//active
    }
    
    if( $_Categorie->isAlbum() )    // Zone albums
    {
        $html .= "><a href='albumPhoto.php?idAlbum=".getMostRecentAlbum()."'>".$_Categorie->getTitre()."</a>";
    }
    else if( $_Categorie->isLivreOr() )  // Lien special si livre d or
    {
        $html .= "><a href='livreDOr.php?numPage=1'>".$_Categorie->getTitre()."</a>";
    }
    else
    {
        $html.="><a href='".$_Categorie->getUrl()."'>".$_Categorie->getTitre()."</a>";
    }
	
	$SousCategoriesN2 = NULL; // Cat使ories filles de la cat使orie du tour de boucle du foreach
	// Si la cat使orie en cours � des filles
	if($SousCategoriesN2 = $category->getSousCategories($_Categorie->getId()))
	{
		$html.="<ul>";
		foreach ($SousCategoriesN2 as $CategorieN2)
		{
			$html.="<li";
			if( $CategorieN2->getID() == $LinkedCategory->getID() )
            {
				$html.=" class='Nactive'";
            }
            if( $CategorieN2->isLivreOr() )  // Lien special si livre d or
            {
                $html .= "><a href='livreDOr.php?numPage=1'>".$CategorieN2->getTitre()."</a>";
            }
            else
            {
                $html.= "><a href='".$CategorieN2->getUrl()."'>".$CategorieN2->getTitre()."</a>";
            }
            
			
            
            $SousCategoriesN3 = NULL; // Cat使ories filles de la cat使orie du tour de boucle du foreach
            // Si la cat使orie en cours � des filles (Niveau 3 _MAX)
            if($SousCategoriesN3 = $category->getSousCategories($CategorieN2->getId()))
            {
                $html.="<ul>";
                foreach ($SousCategoriesN3 as $CategorieN3)
                {
                    $html.="<li";
                    if($CategorieN3->getID() == $LinkedCategory->getID())
                        $html.=" class='Nactive'";
                    $html.= "><a href='".$CategorieN3->getUrl()."'>".$CategorieN3->getTitre()."</a>";
                    
                }
                $html.="</ul>";
            }
            $html.="</li>";
		}
		$html.="</ul>";
	}
	$html.="</li>";
	
	
	
}
$html.="</ul>";




echo $html;





?>
