with P_Liste_Chainee;

generic
   type T is private;
   with procedure afficherContenu(contenu: in T);
   with function "="(a: in T; b: in T) return Boolean;
package P_Arbre_Binaire is
   --
   -- Lev�e si une fonction/proc�dure est appliqu�e sur un arbre null.
   --
   ArbreVideException: Exception;
   --
   -- Lev�e si un noeud de l'arbre n'existe pas.
   --
   NoeudInexistantException: Exception;
     
   type Arbre_Binaire is private;
   
   package P_Liste_Chainee_T is new P_Liste_Chainee(T_Valeur      => T,
                                                    afficherElement => afficherContenu);
   use P_Liste_Chainee_T;

   --
   -- Cr�e un arbre binaire ayant pour racine le noeud pass� en param�tre.
   --
   function creerArbreBinaire(contenu: in T) return Arbre_Binaire;
   --
   -- Renvoie 'True' si l'arbre 'arbre' est vide.
   --
   function estVide(arbre: in Arbre_Binaire) return Boolean;
   --
   -- D�finit l'enfant droit 'enfant' du noeud 'parent' contenu dans l'arbre 'arbre'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'.
   --
   procedure setEnfantDroit(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   --
   -- D�finit l'enfant gauche 'enfant' du noeud 'parent' contenu dans l'arbre 'arbre'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'.
   --
   procedure setEnfantGauche(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   --
   -- Renvoie l'enfant droit du noeud 'parent' contenu dans l'arbre 'arbre'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'
   -- ou si parent ne contient pas d'enfant droit.
   --
   function getEnfantDroit(arbre: in Arbre_Binaire; parent: in T) return T;
   --
   -- Renvoie l'enfant gauche du noeud 'parent' contenu dans l'arbre 'arbre'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'parent'
   -- ou si parent ne contient pas d'enfant gauche.
   --
   function getEnfantGauche(arbre: in Arbre_Binaire; parent: in T) return T;
   --
   -- Supprime le noeud 'noeud' et ses enfants de l'arbre binaire 'arbre'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   procedure supprimerNoeud(arbre: in out Arbre_Binaire; noeud: in T);
   --
   -- Obtient le sous-arbre de l'arbre 'arbre' ayant pour racine 'noeud'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   function getSousArbre(arbre: in Arbre_Binaire; noeud: in T) return Arbre_Binaire;
   --
   -- Retourne True si l'arbre 'arbre' contient le noeud 'noeud'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   function possedeNoeud(arbre: in Arbre_Binaire; noeud: in T) return Boolean;
   --
   -- Affiche l'arbre binaire 'arbre' en version pr�fixe
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   procedure afficher(arbre: in Arbre_Binaire);
   --
   -- Affiche l'arbre binaire 'arbre' en version pr�fixe � partir du noeud 'noeud_depart'
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   procedure afficher(arbre: in Arbre_Binaire; noeud_depart: in T);
   
   --
   -- Renvoie le nombre de noeuds contenus dans l'arbre 'arbre', 0 si l'arbre est vide.
   --
   function nombreNoeuds(arbre: in Arbre_Binaire) return Integer;
   
   --
   -- Renvoie la liste des enfants du noeud racine de l'arbre 'arbre' qui sont � une distance 'profondeur' de lui
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   function getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer) return Liste_Chainee;
   --
   -- Peuple la liste 'liste' avec les enfants du noeud racine de l'arbre 'arbre' qui sont � une distance 'profondeur' de lui.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   procedure getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer; liste: in out Liste_Chainee);
   
   --
   -- Renvoie la liste des noeuds contenus dans l'arbre 'arbre' ayant 'nombre_enfant' enfants.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   function getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer) return Liste_Chainee;
   --
   -- Peuple la liste 'liste' avec les noeuds contenus dans l'arbre 'arbre' ayant 'nombre_enfant' enfants.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   procedure getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer; liste: in out Liste_Chainee);
   
   --
   -- Retourne le noeud de l'arbre 'arbre' pr�c�dent le noeud 'noeud' d'une distance de 'profondeur'.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
   --
   function getNoeudAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T;
   --
   -- Retourne la liste des noeuds de l'arbre 'arbre' pr�c�dent le noeud 'noeud' � partir de la distance 'profondeur'.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   -- L�ve une NoeudInexistantException si 'arbre' ne contient pas le noeud 'noeud'.
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
   -- Affiche le noeud racine de l'arbre 'arbre' avec 'espace'*4 espaces � gauche,
   -- puis affiche son enfant gauche, puis son enfant droit avec '(espace'+1)*4 espaces � gauche.
   --
   procedure afficher(arbre: in Arbre_Binaire; espace: in Integer);
   
   --
   -- Retourne le sous-arbre de l'arbre 'arbre' pr�c�dent le noeud 'noeud'.
   -- L�ve une ArbreVideException si l'arbre' est vide.
   --
   function getArbreAvant(arbre: in Arbre_Binaire; noeud: in Arbre_Binaire) return Arbre_Binaire;
end P_Arbre_Binaire;
