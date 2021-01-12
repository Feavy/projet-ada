with Ada.Text_IO; use Ada.Text_IO;

package body P_Personne is

   
   function creerPersonne(id: in Integer) return Personne is
      p: Personne;
   begin
      p.id := id;
      return p;
   end creerPersonne;
   
   procedure afficher(laPersonne: in Personne) is
   begin
      Put(laPersonne.id'Image);
   end afficher;
   
   function "="(a: in Personne; b: in Personne) return Boolean is
   begin
      return a.id = b.id;
   end "=";
   
end P_Personne;
