with Ada.Text_IO; use Ada.Text_IO;

package body P_Var_String is

   function Var_String(str: String) return T_Var_String is
      rep: T_Var_String;
   begin
      rep.taille := str'Length;
      rep.valeur(1..rep.taille) := str;
      return rep;
   end Var_String;
   
   procedure put(str: in T_Var_String) is
   begin
      Put(str.valeur(1..str.taille));
   end put;

   function Image(str: in T_Var_String) return String is
   begin
      return str.valeur(1..str.taille);
   end Image;
end P_Var_String;
