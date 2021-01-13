with Ada.Text_IO; use Ada.Text_IO;

package body P_Arbre_Binaire is

   function creerArbreBinaire(contenu: in T) return Arbre_Binaire is
   begin
      return new Noeud'(null, null, contenu);
   end creerArbreBinaire;
   
   procedure setEnfantDroit(arbre: in Arbre_Binaire; parent: in T; enfant: in T) is
      sous_arbre: Arbre_Binaire;
   begin
      if arbre = null then
         raise ArbreVideException;
      end if;
      
      sous_arbre := getSousArbre(arbre, parent);
      if sous_arbre = null then
         raise NoeudInexistantException;
      end if;
      
      sous_arbre.enfant_droit := new Noeud'(null, null, enfant);
   end setEnfantDroit;
   
   procedure setEnfantGauche(arbre: in Arbre_Binaire; parent: in T; enfant: in T) is
      sous_arbre: Arbre_Binaire;
   begin
      if arbre = null then
         raise ArbreVideException;
      end if;
      
      sous_arbre := getSousArbre(arbre, parent);
      if sous_arbre = null then
         raise NoeudInexistantException;
      end if;
      
      sous_arbre.enfant_gauche := new Noeud'(null, null, enfant);
   end setEnfantGauche;
   
   procedure supprimerNoeud(arbre: in out Arbre_Binaire; noeud: in T) is
   begin
      if arbre = null then
         raise ArbreVideException;
      end if;
      
      if not possedeNoeud(arbre, noeud) then
         raise NoeudInexistantException;
      end if;
      
      if arbre.contenu = noeud then
         arbre := null;
         return;
      end if;
      
      if arbre.enfant_droit /= null and then arbre.enfant_droit.contenu = noeud then
         arbre.enfant_droit := null;
      elsif arbre.enfant_gauche /= null and then arbre.enfant_gauche.contenu = noeud then
         arbre.enfant_gauche := null;
      else
         supprimerNoeud(arbre.enfant_droit, noeud);
         supprimerNoeud(arbre.enfant_gauche, noeud);
      end if;
      
   end supprimerNoeud;
   
   function getSousArbre(arbre: in Arbre_Binaire; noeud: in T) return Arbre_Binaire is
      sous_arbre: Arbre_Binaire := arbre;
   begin
      if sous_arbre = null then
         raise ArbreVideException;
      end if;
      
      if sous_arbre.contenu = noeud then
         return sous_arbre;
      end if;
      
      begin
         sous_arbre := getSousArbre(sous_arbre.enfant_gauche, noeud);
         if sous_arbre /= null then
            return sous_arbre;
         end if;
      exception
         when ArbreVideException => null;
      end;
      
      sous_arbre := arbre;
      
      begin    
         sous_arbre := getSousArbre(sous_arbre.enfant_droit, noeud);
         if sous_arbre /= null then
            return sous_arbre;
         end if;
      exception
         when ArbreVideException => null;
      end;
      
      return null;
   end getSousArbre;
   
   function possedeNoeud(arbre: in Arbre_Binaire; noeud: in T) return Boolean is
   begin
      return getSousArbre(arbre, noeud) /= null;
   end possedeNoeud;
   
   -- Affiche l'arbre binaire en version préfixe
   procedure afficher(arbre: in Arbre_Binaire) is
   begin
      afficher(arbre, 0);
   end afficher;
   
   procedure afficher(arbre: in Arbre_Binaire; noeud_depart: in T) is
   begin
      afficher(getSousArbre(arbre, noeud_depart), 0);
   end afficher;
      
   procedure afficher(arbre: in Arbre_Binaire; espace: in Integer) is
   begin
      if arbre = null then
         raise ArbreVideException;
      end if;
      
      for i in 1..espace*4 loop
         Put(" ");
      end loop;
      Put("-- ");
      
      afficherContenu(arbre.contenu);
      New_Line;
      begin
         afficher(arbre.enfant_gauche, espace+1);
      exception
         when ArbreVideException => null;
      end;
      begin
         afficher(arbre.enfant_droit, espace+1);
      exception
         when ArbreVideException => null;
      end;
      
   end afficher;
   
   function nombreNoeuds(arbre: in Arbre_Binaire) return Integer is
   begin
      if arbre = null then
         return 0;
      end if;
      
      return 1+nombreNoeuds(arbre.enfant_gauche)+nombreNoeuds(arbre.enfant_droit);
   end nombreNoeuds;
   
   function getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer) return Liste_Chainee is
      liste: Liste_Chainee;
   begin
      getNoeudsApres(arbre, profondeur, liste);
      return liste;
   end getNoeudsApres;
   
   procedure getNoeudsApres(arbre: in Arbre_Binaire; profondeur: in Integer; liste: in out Liste_Chainee) is
   begin
      if arbre = null then
         return;
      end if;
      
      if profondeur = 0 then
         P_Liste_Chainee_T.ajouter(liste, arbre.contenu);
      elsif profondeur > 0 then
         getNoeudsApres(arbre.enfant_gauche, profondeur-1, liste);
         getNoeudsApres(arbre.enfant_droit, profondeur-1, liste);
      end if;
   end getNoeudsApres;
   
      
   function getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer) return Liste_Chainee is
      liste: Liste_Chainee := creerListe;
   begin
      getNoeudsViaNombreEnfants(arbre, nombre_enfants, liste);
      return liste;
   end getNoeudsViaNombreEnfants;
   
   procedure getNoeudsViaNombreEnfants(arbre: in Arbre_Binaire; nombre_enfants: in Integer; liste: in out Liste_Chainee) is
      nombre_enfants_courant: Integer := 0;
   begin
      if arbre = null then
         return;
      end if;
      
      if arbre.enfant_gauche /= null then
         nombre_enfants_courant := nombre_enfants_courant+1;
         getNoeudsViaNombreEnfants(arbre.enfant_gauche, nombre_enfants, liste);
      end if;
      
      if arbre.enfant_droit /= null then
         nombre_enfants_courant := nombre_enfants_courant+1;
         getNoeudsViaNombreEnfants(arbre.enfant_droit, nombre_enfants, liste);
      end if;
      
      if nombre_enfants_courant = nombre_enfants then
         P_Liste_Chainee_T.ajouter(liste, arbre.contenu);
      end if;
   end getNoeudsViaNombreEnfants;
   
   function getArbreAvant(arbre: in Arbre_Binaire; noeud: in Arbre_Binaire) return Arbre_Binaire is
      noeud_avant: Arbre_Binaire;
   begin
      if arbre.enfant_droit = noeud or arbre.enfant_gauche = noeud then
         return arbre;
      end if;
      
      if arbre.enfant_droit /= null then
        noeud_avant := getArbreAvant(arbre.enfant_droit, noeud);
      end if;
   
      if noeud_avant = null and arbre.enfant_gauche /= null then
         noeud_avant := getArbreAvant(arbre.enfant_gauche, noeud);
      end if;
      
      return noeud_avant;
   end getArbreAvant;
   
   function getArbreAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return Arbre_Binaire is
      sous_arbre: Arbre_Binaire := getSousArbre(arbre, noeud);
   begin
      if arbre = null then
         raise ArbreVideException;
      end if;
      
      if sous_arbre = null then
         raise NoeudInexistantException;
      end if;
      
      for i in 1..profondeur loop
         sous_arbre := getArbreAvant(arbre, sous_arbre);
      end loop;
      
      return sous_arbre;
   end getArbreAvant;
   
   function getNoeudAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T is
   begin
      return getArbreAvant(arbre, noeud, profondeur).contenu;
   end getNoeudAvant;
   
   function getSuccessionNoeudsAvant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return Liste_Chainee is
      noeud2: Arbre_Binaire;
      liste_noeuds: Liste_Chainee;
   begin
      noeud2 := getArbreAvant(arbre, noeud, profondeur);
      
      loop
         P_Liste_Chainee_T.ajouter(liste_noeuds, noeud2.contenu);
         noeud2 := getArbreAvant(arbre, noeud2);
         exit when noeud2 = null;
      end loop;
      
      return liste_noeuds;
   end getSuccessionNoeudsAvant;
   
end P_Arbre_Binaire;
