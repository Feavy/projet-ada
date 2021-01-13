with P_Liste_Chainee;

generic
   type T is private;
   with procedure afficherContenu(contenu: in T);
   with function "="(a: in T; b: in T) return Boolean;
package P_Arbre_Binaire is
   ArbreVideException: Exception;
   NoeudInexistantException: Exception;
     
   type Arbre_Binaire is private;
   
   package P_Liste_Chainee_T is new P_Liste_Chainee(T_Valeur      => T,
                                                    afficherElement => afficherContenu);
   use P_Liste_Chainee_T;

   function creerArbreBinaire(contenu: in T) return Arbre_Binaire;
   procedure setEnfantDroit(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   procedure setEnfantGauche(arbre: in Arbre_Binaire; parent: in T; enfant: in T);
   procedure supprimerNoeud(arbre: in out Arbre_Binaire; noeud: in T);
   function getSousArbre(arbre: in Arbre_Binaire; noeud: in T) return Arbre_Binaire;
   function possedeNoeud(arbre: in Arbre_Binaire; noeud: in T) return Boolean;
   -- Affiche l'arbre binaire en version préfixe
   procedure afficher(arbre: in Arbre_Binaire);
   procedure afficher(arbre: in Arbre_Binaire; noeud_depart: in T);
   
   function nombreNoeuds(arbre: in Arbre_Binaire) return Integer;
   
   function getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer) return Liste_Chainee;
   procedure getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer; liste: in out Liste_Chainee);
   
   function getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer) return Liste_Chainee;
   procedure getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer; liste: in out Liste_Chainee);

   function getArbreAvant(arbre: in Arbre_Binaire; noeud: in Arbre_Binaire) return Arbre_Binaire;
   
   function getNoeudAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T;
   function getSuccessionNoeudsAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return Liste_Chainee;

private
   type Noeud;
   type Arbre_Binaire is access Noeud;
   type Noeud is record
      enfant_gauche: Arbre_Binaire;
      enfant_droit: Arbre_Binaire;
      contenu: T;
   end record;
   
   procedure afficher(arbre: in Arbre_Binaire; espace: in Integer);
end P_Arbre_Binaire;
