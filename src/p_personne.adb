with Ada.Text_IO; use Ada.Text_IO;
with P_Var_String; use P_Var_String;

package body P_Personne is

   function creerPersonne(id: in Integer) return Personne is
      p: Personne;
   begin
      p.id := id;
      return p;
   end creerPersonne;
   
   function creerPersonne(id: in Integer; prenom: String; nom: String) return Personne is
      p: Personne;
   begin
      p.id := id;
      p.prenom := Var_String(prenom);
      p.nom := Var_String(nom);
      return p;
   end creerPersonne;
   
   procedure afficher(laPersonne: in Personne) is
   begin
      Put(laPersonne.id'Image & " " & Image(laPersonne.prenom) & " " & Image(laPersonne.nom));
   end afficher;
   
   function "="(a: in Personne; b: in Personne) return Boolean is
   begin
      return a.id = b.id;
   end "=";
   
end P_Personne;
