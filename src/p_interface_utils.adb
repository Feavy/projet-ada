with Ada.Text_IO; use Ada.Text_IO;
with P_Personne; use P_Personne;
with P_Var_String; use P_Var_String;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body p_interface_utils is

   function demanderEntierPositif(message: String) return Integer is
      input: Integer;
   begin
      loop
         Put_Line(message);
         Get(input);
         exit when input >= 0;
      end loop;
      return input;
   end demanderEntierPositif;
   
   function demanderPersonne(message: String) return Personne is
      laPersonne: Personne;
   begin
      Put_Line(message);
      laPersonne.id := demanderEntierPositif("ID :");
      Skip_Line;
      Put_Line("Prenom :");
      Get(laPersonne.prenom);
      Put_Line("Nom :");
      Get(laPersonne.nom);
      return laPersonne;
   end demanderPersonne;
   
   
end p_interface_utils;
