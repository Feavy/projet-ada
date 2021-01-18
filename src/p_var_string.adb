with Ada.Text_IO; use Ada.Text_IO;

package body P_Var_String is

   function Var_String(str: String) return T_Var_String is
      rep: T_Var_String;
   begin
      rep.taille := str'Length;
      rep.valeur(1..rep.taille) := str;
      return rep;
   end Var_String;
   
   procedure Put(str: in T_Var_String) is
   begin
      Put(str.valeur(1..str.taille));
   end Put;

   procedure Get(str: out T_Var_String) is
   begin
      Get_Line(str.valeur, str.taille);
   end Get;

   function Image(str: in T_Var_String) return String is
   begin
      return str.valeur(1..str.taille);
   end Image;
   
   function "="(a: in T_Var_String; b: in T_Var_String) return Boolean is
   begin
      return a.taille = b.taille and then a.valeur(1..a.taille) = b.valeur(1..b.taille);
   end "=";
   
   function "="(a: in T_Var_String; b: in String) return Boolean is
      b2: T_Var_String := Var_String(b);
   begin
      return a = b2;
   end "=";
   
end P_Var_String;
