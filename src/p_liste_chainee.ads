generic
   type T_Valeur is private;
   with procedure afficherElement(e: in T_Valeur);
package P_Liste_Chainee is
   ListeVideException: Exception;
   ElementNonTrouveException: Exception;
   
   type Liste_Chainee is private;
   
   --
   -- Renvoie une nouvelle liste, vide.
   --
   function creerListe return Liste_Chainee;
   --
   -- Retourne 'Vrai' si liste est vide.
   --
   function estVide(liste: in Liste_Chainee) return Boolean;
   --
   -- Ajoute l'élément valeur à la fin de liste.
   --
   procedure ajouter(liste: in out Liste_Chainee; valeur: in T_Valeur);
   --
   -- Ajoute tous les éléments de autre à la fin de liste.
   --
   procedure ajouterTout(liste: in out Liste_Chainee; autre: in Liste_Chainee);
   --
   -- Affiche liste.
   --
   procedure afficher(liste: in Liste_Chainee);
   --
   -- Retourne l'élément de liste en position indice.
   --
   function get(liste: in Liste_Chainee; indice: in Integer) return T_Valeur;
   --
   -- Retourne la taille de liste.
   --
   function taille(liste: in Liste_Chainee) return Integer;
   --
   -- Retourne la sous-liste de liste ayant pour premiere valeur : valeur. 
   --
   function trouver(liste: in Liste_Chainee; valeur: in T_Valeur) return Liste_Chainee;
   --
   -- Supprime valeur de liste.
   --
   procedure supprimer(liste: in out Liste_Chainee; valeur: in T_Valeur);
private
   type Cellule is record
      valeur: T_Valeur;
      suivant: Liste_Chainee;
   end record;
   
   type Liste_Chainee is access Cellule;
    
end P_Liste_Chainee;
