package P_Personne is

   type Personne is record
      id: Integer;
   end record;
      
   function creerPersonne(id: in Integer) return Personne;
   procedure afficher(laPersonne: in Personne);
   function "="(a: in Personne; b: in Personne) return Boolean;

end P_Personne;
