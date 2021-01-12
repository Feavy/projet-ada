with P_Arbre_Genealogique; use P_Arbre_Genealogique;
with P_Personne; use P_Personne;

with Ada.Text_IO; use Ada.Text_IO;

procedure test_p_arbre_genealogique is
   arbre: Arbre_Genealogique;
   liste: Liste_Personne;
begin
    --18
    -- p�re : 2
        -- p�re : 15
            -- m�re : 5
        -- m�re : 26
            -- p�re : 4
    -- m�re : 8
        -- m�re : 33
            -- p�re : 25
            -- m�re : 42
   arbre := creerArbreGenealogique(creerPersonne(18));
   P_Arbre_Genealogique.setPere(arbre, 18, creerPersonne(2));
   P_Arbre_Genealogique.setMere(arbre, 18, creerPersonne(8));
   
   P_Arbre_Genealogique.setPere(arbre, 2, creerPersonne(15));
   P_Arbre_Genealogique.setMere(arbre, 2, creerPersonne(26));
   
   P_Arbre_Genealogique.setMere(arbre, 15, creerPersonne(5));
      
   P_Arbre_Genealogique.setPere(arbre, 26, creerPersonne(4));

   P_Arbre_Genealogique.setMere(arbre, 8, creerPersonne(33));

   P_Arbre_Genealogique.setPere(arbre, 33, creerPersonne(25));
   P_Arbre_Genealogique.setMere(arbre, 33, creerPersonne(42));
   
   P_Arbre_Genealogique.afficher(arbre);
   
   New_Line;
   Put_Line("Suppression du noeud n�2");
   New_Line;
   
   P_Arbre_Genealogique.supprimerPersonne(arbre, 2);
   
   P_Arbre_Genealogique.afficher(arbre);
   
   Put_Line("Personnes avec un seul parent :");
   liste := getPersonnesAvecUnSeulParent(arbre);
   afficher(liste);
end test_p_arbre_genealogique;
