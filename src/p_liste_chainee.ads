generic
   type T_Valeur is private;
   with procedure afficherElement(e: in T_Valeur);
package P_Liste_Chainee is
   ListeVideException: Exception;
   ElementNonTrouveException: Exception;
   
   type Liste_Chainee is private;
   
   function creerListe return Liste_Chainee;
   function estVide(liste: in Liste_Chainee) return Boolean;
   procedure ajouter(liste: in out Liste_Chainee; valeur: in T_Valeur);
   procedure ajouterTout(liste: in out Liste_Chainee; autre: in Liste_Chainee);
   procedure afficher(liste: in Liste_Chainee);
   function trouver(liste: in Liste_Chainee; valeur: in T_Valeur) return Liste_Chainee;
   procedure supprimer(liste: in out Liste_Chainee; valeur: in T_Valeur);
private
   type Cellule is record
      valeur: T_Valeur;
      suivant: Liste_Chainee;
   end record;
   
   type Liste_Chainee is access Cellule;
    
end P_Liste_Chainee;
