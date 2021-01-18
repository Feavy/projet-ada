package P_Var_String is

   TAILLE_MAX: Integer := 50;
   
   type T_Var_String is record
      valeur: String(1..TAILLE_MAX);
      taille: Integer;
   end record;
   
   function Var_String(str: String) return T_Var_String;
   procedure Put(str: in T_Var_String);
   function Image(str: in T_Var_String) return String;
   procedure Get(str: out T_Var_String);
   function "="(a: in T_Var_String; b: in T_Var_String) return Boolean;
   function "="(a: in T_Var_String; b: in String) return Boolean;
end P_Var_String;
