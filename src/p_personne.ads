with P_Var_String; use P_Var_String;

package P_Personne is

   type Personne is record
      id: Integer; -- Identifiant de la personne
      prenom: T_Var_String;
      nom: T_Var_String;
   end record;
   
   --
   -- Crée une personne à partir d'un ID uniquement et la renvoie.
   -- Ne devrait pas être utilisé ailleurs que dans P_Arbre_Genealogique.
   --
   function creerPersonne(id: in Integer) return Personne;
   --
   -- Crée une personne à partir des informations données et la renvoie.
   --
   function creerPersonne(id: in Integer; prenom: String; nom: String) return Personne;
   --
   -- Affiche les informations d'une personne.
   --
   procedure afficher(laPersonne: in Personne);
   --
   -- Teste l'égalité entre deux personnes. (C'est-à-dire que leur identifiants sont égaux).
   --
   function "="(a: in Personne; b: in Personne) return Boolean;

end P_Personne;
