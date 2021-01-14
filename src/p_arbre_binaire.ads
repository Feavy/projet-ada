with P_Liste_Chainee;

generic
   type T is private;
   with procedure afficherContenu(contenu: in T);
   with function "="(a: in T; b: in T) return Boolean;
package P_Arbre_Binaire is
   --
   -- Levée si une fonction/procédure est appliquée sur un arbre null.
   --
   ArbreVideException: Exception;
   --
   -- Levée si un noeud de l'arbre n'existe pas.
   --
   NoeudInexistantException: Exception;
     
   type Arbre_Binaire is private;
   
   package P_Liste_Chainee_T is new P_Liste_Chainee(T_Valeur      => T,
                                                    afficherElement => afficherContenu);
   use P_Liste_Chainee_T;

   --
   -- Crée un arbre binaire ayant pour racine le noeud passé en paramètre.
   --
   function creerArbreBinaire(contenu: in T) return Arbre_Binaire;
   --
   -- Renvoie 'True' si l'arbre 'arbre' est vide.
   --
   function estVide(arbre: in Arbre_Binaire) return Boolean;
   --
   -- Définit l'enfant droit 'enfant' du noeud 'parent' contenu dans l'arbre 'arbre'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'.
   --
   procedure setEnfantDroit(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   --
   -- Définit l'enfant gauche 'enfant' du noeud 'parent' contenu dans l'arbre 'arbre'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'.
   --
   procedure setEnfantGauche(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   --
   -- Renvoie l'enfant droit du noeud 'parent' contenu dans l'arbre 'arbre'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'
   -- ou si parent ne contient pas d'enfant droit.
   --
   function getEnfantDroit(arbre: in Arbre_Binaire; parent: in T) return T;
   --
   -- Renvoie l'enfant gauche du noeud 'parent' contenu dans l'arbre 'arbre'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'
   -- ou si parent ne contient pas d'enfant gauche.
   --
   function getEnfantGauche(arbre: in Arbre_Binaire; parent: in T) return T;
   --
   -- Supprime le noeud 'noeud' et ses enfants de l'arbre binaire 'arbre'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   procedure supprimerNoeud(arbre: in out Arbre_Binaire; noeud: in T);
   --
   -- Obtient le sous-arbre de l'arbre 'arbre' ayant pour racine 'noeud'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   function getSousArbre(arbre: in Arbre_Binaire; noeud: in T) return Arbre_Binaire;
   --
   -- Retourne True si l'arbre 'arbre' contient le noeud 'noeud'
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function possedeNoeud(arbre: in Arbre_Binaire; noeud: in T) return Boolean;
   --
   -- Affiche l'arbre binaire 'arbre' en version préfixe
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   procedure afficher(arbre: in Arbre_Binaire);
   --
   -- Affiche l'arbre binaire 'arbre' en version préfixe à partir du noeud 'noeud_depart'
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   procedure afficher(arbre: in Arbre_Binaire; noeud_depart: in T);
   
   --
   -- Renvoie le nombre de noeuds contenus dans l'arbre 'arbre', 0 si l'arbre est vide.
   --
   function nombreNoeuds(arbre: in Arbre_Binaire) return Integer;
   
   --
   -- Renvoie la liste des enfants du noeud racine de l'arbre 'arbre' qui sont à une distance 'profondeur' de lui
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer) return Liste_Chainee;
   --
   -- Peuple la liste 'liste' avec les enfants du noeud racine de l'arbre 'arbre' qui sont à une distance 'profondeur' de lui.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   procedure getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer; liste: in out Liste_Chainee);
   
   --
   -- Renvoie la liste des noeuds contenus dans l'arbre 'arbre' ayant 'nombre_enfant' enfants.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer) return Liste_Chainee;
   --
   -- Peuple la liste 'liste' avec les noeuds contenus dans l'arbre 'arbre' ayant 'nombre_enfant' enfants.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   procedure getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer; liste: in out Liste_Chainee);
   
   --
   -- Retourne le noeud de l'arbre 'arbre' précédent le noeud 'noeud' d'une distance de 'profondeur'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   function getNoeudAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T;
   --
   -- Retourne la liste des noeuds de l'arbre 'arbre' précédent le noeud 'noeud' à partir de la distance 'profondeur'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   function getSuccessionNoeudsAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return Liste_Chainee;

private
   type Noeud;
   type Arbre_Binaire is access Noeud;
   type Noeud is record
      enfant_gauche: Arbre_Binaire;
      enfant_droit: Arbre_Binaire;
      contenu: T;
   end record;
   
   --
   -- Affiche le noeud racine de l'arbre 'arbre' avec 'espace'*4 espaces à gauche,
   -- puis affiche son enfant gauche, puis son enfant droit avec '(espace'+1)*4 espaces à gauche.
   --
   procedure afficher(arbre: in Arbre_Binaire; espace: in Integer);
   
   --
   -- Retourne le sous-arbre de l'arbre 'arbre' précédent le noeud 'noeud'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getArbreAvant(arbre: in Arbre_Binaire; noeud: in Arbre_Binaire) return Arbre_Binaire;
end P_Arbre_Binaire;
