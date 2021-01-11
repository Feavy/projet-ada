with Ada.Text_IO; use Ada.Text_IO;

package body P_Liste_Chainee is

   function creerListe return Liste_Chainee is
   begin
      return null;
   end creerListe;
   
   function estVide(liste: in Liste_Chainee) return Boolean is
   begin
        return liste = null;
   end estVide;
   
   procedure ajouter(liste: in out Liste_Chainee; valeur: in T_Valeur) is
      newTete: Liste_Chainee;
   begin
      newTete := new Cellule'(valeur, liste);
      liste := newTete;
   end ajouter;
   
   procedure afficher(liste: in Liste_Chainee) is
      current: Liste_Chainee := liste;
   begin
      while current /= null loop
         afficherElement(current.all.valeur);
         if current.all.suivant /= null then
            Put(", ");
         end if;
         current := current.all.suivant;
      end loop;
      New_Line;
   end afficher;
         
   function trouver(liste: in Liste_Chainee; valeur: in T_Valeur) return Liste_Chainee is
      current: Liste_Chainee := liste;
   begin
      while current /= null and then current.all.valeur /= valeur loop
         current := current.all.suivant;
      end loop;
      return current;
   end trouver;
   
   procedure supprimer(liste: in out Liste_Chainee; valeur: in T_Valeur) is
      current: Liste_Chainee := liste;
   begin
      if current = null then
         raise ListeVideException;
      end if;
      
      if liste.all.valeur = valeur then
         liste := liste.all.suivant;
         return;
      end if;
      
      while current.all.suivant /= null and then current.all.suivant.all.valeur /= valeur loop
         current := current.suivant;
      end loop;
      
      if current.all.suivant = null then
         raise ElementNonTrouveException;
      end if;
      
      current.all.suivant := current.all.suivant.all.suivant;
   end supprimer;

end P_Liste_Chainee;
