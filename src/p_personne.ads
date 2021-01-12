with P_Var_String; use P_Var_String;

package P_Personne is

   type Personne is record
      id: Integer;
      prenom: T_Var_String;
      nom: T_Var_String;
   end record;
      
   function creerPersonne(id: in Integer) return Personne;
   function creerPersonne(id: in Integer; prenom: String; nom: String) return Personne;
   procedure afficher(laPersonne: in Personne);
   function "="(a: in Personne; b: in Personne) return Boolean;

end P_Personne;
