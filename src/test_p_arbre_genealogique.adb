with P_Arbre_Genealogique; use P_Arbre_Genealogique;
with P_Personne; use P_Personne;

with Ada.Text_IO; use Ada.Text_IO;

procedure test_p_arbre_genealogique is
   arbre: Arbre_Genealogique;
   liste: Liste_Personne;
begin
    --18
    -- père : 2
        -- père : 15
            -- mère : 5
        -- mère : 26
            -- père : 4
    -- mère : 8
        -- mère : 33
            -- père : 25
            -- mère : 42
   arbre := creerArbreGenealogique(creerPersonne(18, "Jean", "Machin"));
   P_Arbre_Genealogique.setPere(arbre, 18, creerPersonne(2, "Paul", "Machin"));
   P_Arbre_Genealogique.setMere(arbre, 18, creerPersonne(8, "Claire", "Machine"));
   
   P_Arbre_Genealogique.setPere(arbre, 2, creerPersonne(15, "Pedro", "Machin"));
   P_Arbre_Genealogique.setMere(arbre, 2, creerPersonne(26, "Samia", "Nassri"));
   
   P_Arbre_Genealogique.setMere(arbre, 15, creerPersonne(5, "Camille", "Machin"));
      
   P_Arbre_Genealogique.setPere(arbre, 26, creerPersonne(4, "Frédéric", "Nassri"));

   P_Arbre_Genealogique.setMere(arbre, 8, creerPersonne(33, "Claire", "Dupont"));

   P_Arbre_Genealogique.setPere(arbre, 33, creerPersonne(25, "Fredo", "Dupont"));
   P_Arbre_Genealogique.setMere(arbre, 33, creerPersonne(42, "Justine", "Delaqueduc"));
   
   P_Arbre_Genealogique.afficher(arbre);
   
   New_Line;
   
   Put_Line("Personnes sans parent :");
   liste := getPersonnesSansParent(arbre);
   afficher(liste);
   
   New_Line;
   
   Put_Line("Personnes avec un seul parent :");
   liste := getPersonnesAvecUnSeulParent(arbre);
   afficher(liste);
   
   New_Line;
   
   Put_Line("Personnes avec deux parents :");
   liste := getPersonnesAvecDeuxParents(arbre);
   afficher(liste);
   
   Put_Line("Deuxième descendant de la personne n° 5 :");
   afficher(getDescendant(arbre, 5, 2));
   
   New_Line;
   Put_Line("Suppression du noeud n°2");
   New_Line;
   
   P_Arbre_Genealogique.supprimerPersonne(arbre, 2);
   
   P_Arbre_Genealogique.afficher(arbre);
end test_p_arbre_genealogique;
