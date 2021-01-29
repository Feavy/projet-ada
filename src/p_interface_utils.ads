with P_Personne; use P_Personne;

package p_interface_utils is

   --
   -- Demande en entier positif � l'utilisateur avec le message 'message'.
   --
   function demanderEntierPositif(message: String) return Integer;
   --
   -- Demande les informations d'une personne � l'utilisateur avec le message 'message'.
   --
   function demanderPersonne(message: String) return Personne;
   
end p_interface_utils;
