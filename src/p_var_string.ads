package P_Var_String is

   TAILLE_MAX: Integer := 50;
   
   type T_Var_String is record
      valeur: String(1..TAILLE_MAX);
      taille: Integer;
   end record;
   
   function Var_String(str: String) return T_Var_String;
   procedure put(str: in T_Var_String);
   function Image(str: in T_Var_String) return String;
end P_Var_String;
