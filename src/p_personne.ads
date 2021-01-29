with P_Var_String; use P_Var_String;

package P_Personne is

   type Personne is record
      id: Integer; -- Identifiant de la personne
      prenom: T_Var_String;
      nom: T_Var_String;
   end record;
   
   --
   -- Cr�e une personne � partir d'un ID uniquement et la renvoie.
   -- Ne devrait pas �tre utilis� ailleurs que dans P_Arbre_Genealogique.
   --
   function creerPersonne(id: in Integer) return Personne;
   --
   -- Cr�e une personne � partir des informations donn�es et la renvoie.
   --
   function creerPersonne(id: in Integer; prenom: String; nom: String) return Personne;
   --
   -- Affiche les informations d'une personne.
   --
   procedure afficher(laPersonne: in Personne);
   --
   -- Teste l'�galit� entre deux personnes. (C'est-�-dire que leur identifiants sont �gaux).
   --
   function "="(a: in Personne; b: in Personne) return Boolean;

end P_Personne;
