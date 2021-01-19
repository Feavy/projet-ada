with P_Arbre_Genealogique; use P_Arbre_Genealogique;
use P_Arbre_Genealogique.P_Arbre_Binaire_Personne;
with P_Personne; use P_Personne;

with Ada.Text_IO; use Ada.Text_IO;

procedure test_p_arbre_genealogique is
   arbre: Arbre_Genealogique;
   liste: Liste_Personne;
   unePersonne: Personne;
   pragma Assertion_Policy(CHECK);
begin
--  18 Jean Machin
    --  2 Paul Machin
        --  15 Pedro Machin
            --  5 Camille Machin
        --  26 Samia Nassri
            --  4 Frédéric Nassri
    --  8 Claire Machine
        --  33 Claire Dupont
            --  25 Fredo Dupont
            --  42 Justine Delaqueduc
   arbre := creerArbreGenealogique(creerPersonne(18, "Jean", "Machin"));
   pragma Assert(not estVide(arbre), "creerArbreGenealogique ne devrait pas retourner un arbre vide.");
   P_Arbre_Genealogique.setPere(arbre, 18, creerPersonne(2, "Paul", "Machin"));
   pragma Assert(getEnfantGauche(Arbre_Binaire(arbre), creerPersonne(18)) = creerPersonne(2),
                "setPere devrait définir correctement l'enfant gauche de l'arbre binaire");
   P_Arbre_Genealogique.setMere(arbre, 18, creerPersonne(8, "Claire", "Machine"));
   pragma Assert(getEnfantDroit(Arbre_Binaire(arbre), creerPersonne(18)) = creerPersonne(8),
                "setMere devrait définir correctement l'enfant droit de l'arbre binaire");
   
   P_Arbre_Genealogique.setPere(arbre, 2, creerPersonne(15, "Pedro", "Machin"));
   P_Arbre_Genealogique.setMere(arbre, 2, creerPersonne(26, "Samia", "Nassri"));
   
   P_Arbre_Genealogique.setMere(arbre, 15, creerPersonne(5, "Camille", "Machin"));
      
   P_Arbre_Genealogique.setPere(arbre, 26, creerPersonne(4, "Frédéric", "Nassri"));

   P_Arbre_Genealogique.setMere(arbre, 8, creerPersonne(33, "Claire", "Dupont"));

   P_Arbre_Genealogique.setPere(arbre, 33, creerPersonne(25, "Fredo", "Dupont"));
   P_Arbre_Genealogique.setMere(arbre, 33, creerPersonne(42, "Justine", "Delaqueduc"));
   
   P_Arbre_Genealogique.afficher(arbre);
   
   Put_Line("Ajout d'une personne déjà présente");
   begin
      P_Arbre_Genealogique.setPere(arbre, 25, creerPersonne(15, "ID", "dejapris"));
      pragma Assert(False, "Le fait d'ajouter une personne déjà existante dans l'arbre devrait lever une exception.");
   exception
      when PersonneDejaPresenteException => null;
   end;
     
   New_Line;
   
   Put_Line("Personnes sans parent :");
   liste := getPersonnesSansParent(arbre);
   afficher(liste);
   pragma Assert(taille(liste) = 4);
   pragma Assert(get(liste, 0).id = 42);
   pragma Assert(get(liste, 1).id = 25);
   pragma Assert(get(liste, 2).id = 4);
   pragma Assert(get(liste, 3).id = 5);
   
   New_Line;
   
   Put_Line("Personnes avec un seul parent :");
   liste := getPersonnesAvecUnSeulParent(arbre);
   afficher(liste);
   pragma Assert(taille(liste) = 3);
   pragma Assert(get(liste, 0).id = 8);
   pragma Assert(get(liste, 1).id = 26);
   pragma Assert(get(liste, 2).id = 15);
   
   New_Line;
   
   Put_Line("Personnes avec deux parents :");
   liste := getPersonnesAvecDeuxParents(arbre);
   afficher(liste);
   pragma Assert(taille(liste) = 3);
   pragma Assert(get(liste, 0).id = 18);
   pragma Assert(get(liste, 1).id = 33);
   pragma Assert(get(liste, 2).id = 2);
   
   New_Line;
   
   Put_Line("Deuxième descendant de la personne n° 5 :");
   unePersonne := getDescendant(arbre, 5, 2);
   afficher(unePersonne);
   pragma Assert(unePersonne.id = 2);
   New_Line;
   New_Line;
   
   Put_Line("Descendance de la personne n° 5 à partir de la génération 2 :");
   liste := getDescendance(arbre, 5, 2);
   afficher(liste);
   pragma Assert(taille(liste) = 2);
   pragma Assert(get(liste, 0).id = 18);
   pragma Assert(get(liste, 1).id = 2);
   New_Line;
   
   Put_Line("Ancêtres de génération 2 de la personne n° 2 :");
   liste := getAncetres(arbre, 2, 2);
   afficher(liste);
   pragma Assert(taille(liste) = 2);
   pragma Assert(get(liste, 0).id = 4);
   pragma Assert(get(liste, 1).id = 5);
   New_Line;
   
   Put_Line("Suppression du noeud n°2");
   New_Line;
   
   P_Arbre_Genealogique.supprimerPersonne(arbre, 2);
   
   P_Arbre_Genealogique.afficher(arbre);
   
   pragma Assert(not P_Arbre_Genealogique.possedePersonne(arbre, 2), "L'arbre ne devrait plus posséder de personne d'ID 2.");
   
   New_Line;
   Put_Line("Obtention d'un descendant inconnu.");
   begin
      afficher(getDescendant(arbre, 18, 1));
      pragma Assert(False, "Une PersonneInconnueException aurait dû être levée");
   exception
      when PersonneInconnueException => null;
   end;
   
   end test_p_arbre_genealogique;
