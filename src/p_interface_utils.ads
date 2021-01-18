with P_Personne; use P_Personne;

package p_interface_utils is

   function demanderEntierPositif(message: String) return Integer;
   function demanderPersonne(message: String) return Personne;
   
end p_interface_utils;
