with Ada.Text_IO; use Ada.Text_IO;
with P_Arbre_Binaire;

procedure test_p_arbre_binaire is
   procedure afficher(i: Integer) is
   begin
      put(i'Image);
   end afficher;
   
   package P_Arbre_Binaire_Entier is new P_Arbre_Binaire(T               => Integer,
                                                         afficherContenu => afficher,
                                                         "="             => "=");
   use P_Arbre_Binaire_Entier;
   arbre: Arbre_Binaire;
   arbre2: Arbre_Binaire;
begin
   arbre := creerArbreBinaire(contenu => 5);
   setEnfantDroit(arbre, 5, 4);
   setEnfantGauche(arbre, 5, 6);
   
   setEnfantGauche(arbre, 6, 9);
   setEnfantDroit(arbre, 9, 12);
   --afficher(arbre);
   
   --afficher(getNoeudAvant(arbre      => arbre,
   --                       noeud      => 12,
   --                       profondeur => 1));
   arbre2 := getSousArbre(arbre => arbre,
                          noeud => 12);
   arbre2 := getArbreAvant(arbre      => arbre,
                           noeud      => arbre2);
   afficher(arbre2);
end test_p_arbre_binaire;
