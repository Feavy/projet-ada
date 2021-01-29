with Ada.Text_IO; use Ada.Text_IO;
with P_Var_String; use P_Var_String;

with p_interface_utils; use p_interface_utils;
with P_Arbre_Genealogique; use P_Arbre_Genealogique;

with P_Personne; use P_Personne;

procedure interfacePrincipale is
   choice: T_Var_String;
   arbre: Arbre_Genealogique;
   compte: Integer;
   idPersonne: Integer;
begin
   New_Line;
   Put_Line("BIENVENUE DANS L'INTERFACE DE MANIPULATION D'ARBRE GENEALOGIQUE !");
   New_Line;
   loop
      Put_Line("+-----------------+");
      Put_Line("|    COMMANDES    |");
      Put_Line("+-----------------+");
      New_Line;
      Put_Line("creer : Créer un nouvel arbre généaologique.");
      Put_Line("setPere : Définir le père d'une personne de l'arbre.");
      Put_Line("setMere : Définir la mère d'une personne de l'arbre.");
      Put_Line("supprimer : Supprimer une personne et ses ancêtres de l'arbre.");
      Put_Line("afficher : Affiche l'arbre à partir d'un noeud donné.");
      Put_Line("sansParent : Affiche l'ensemble des individus qui n'ont pas de parent connu.");
      Put_Line("unParent : Affiche l'ensemble des individus qui n'ont qu'un parent connu.");
      Put_Line("deuxParents : Affiche l'ensemble des individus qui ont deux parents connus.");
      Put_Line("nombreAncetres : Affiche le nombre d'ancêtres d'une personne (elle compris).");
      Put_Line("ancetres : Affiche l'ensemble des ancêtres situés à une certaine génération d'une personne donnée.");
      Put_Line("ancetres2 : Affiche la succession d'ancêtres d'une génération donnée pour un noeud donné.");
      Put_Line("descendant : Affiche le descendant d'une personne donné situé à une génération donnée.");
      Put_Line("descendance : Affiche la succession de descendants d'une personne donnée à partir d'une certaine génération.");
      Put_Line("quitter : Quitte le programme");
      New_Line;
      Put("Votre choix : ");
      Get(choice);
      New_Line;
      Put_Line("--------");
      New_Line;
      begin
        if choice = "creer" then
            arbre := creerArbreGenealogique(laPersonne => demanderPersonne("Veuillez entrer les informations de la personne racine :"));
            New_Line;
            Put("L'arbre a bien été créé.");
        elsif choice = "setPere" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de l'enfant dont il faut associer le père : ");
            setPere(arbre  => arbre,
                    idFils => idPersonne,
                    pere   => demanderPersonne("Veuillez entrer les informations du père à définir :"));
            New_Line;
            Put("Le père a bien été défini.");
       elsif choice = "setMere" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de l'enfant dont il faut associer la mère :");
            setMere(arbre  => arbre,
                    idFils => idPersonne,
                    mere   => demanderPersonne("Veuillez entrer les informations de la mère à définir :"));
            New_Line;
            Put("La mère a bien été définie.");
        elsif choice = "supprimer" then
            supprimerPersonne(arbre => arbre,
                              id    => demanderEntierPositif("Veuillez entrer l'ID de la personne à supprimer : "));
            Put("La personne et ses ancêtres ont bien été supprimés.");
        elsif choice = "nombreAncetres" then
            compte := nombreAncetres(arbre => arbre,
                                     id    => demanderEntierPositif("Veuillez entrer l'ID de la personne dont compter les ancêtres :"));
            Put("Nombre d'ancêtres : " & compte'Image);
        elsif choice = "afficher" then
            Put_Line("Arbre :");
            afficher(arbre => arbre);
        elsif choice = "sansParent" then
            Put_Line("Enfants sans parent :");
            afficher(getPersonnesSansParent(arbre => arbre));
        elsif choice = "unParent" then
            Put_Line("Enfants sans parent :");
            afficher(getPersonnesAvecUnSeulParent(arbre => arbre));
        elsif choice = "deuxParents" then
            Put_Line("Enfants sans parent :");
            afficher(getPersonnesAvecDeuxParents(arbre => arbre));
        elsif choice = "ancetres" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de la personne dont chercher les ancêtres : ");
            afficher(getAncetres(arbre      => arbre,
                                 filsId     => idPersonne,
                                 generation => demanderEntierPositif("Veuillez entrer la génération des ancêtres à chercher : ")));
        elsif choice = "ancetres2" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de la personne dont chercher les ancêtres : ");
            afficher(getSuccessionAncetres(arbre      => arbre,
                                           filsId     => idPersonne,
                                           generation => demanderEntierPositif("Veuillez entrer la génération à partir de laquelle chercher : ")));
        elsif choice = "descendant" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de la personne dont chercher le descendant : ");
            afficher(getDescendant(arbre      => arbre,
                                   filsId     => idPersonne,
                                   generation => demanderEntierPositif("Veuillez entrer la génération du descendant : ")));
        elsif choice = "descendance" then
            idPersonne := demanderEntierPositif("Veuillez entrer l'ID de la personne dont chercher la descendance : ");
            afficher(getDescendance(arbre      => arbre,
                                    filsId     => idPersonne,
                                    generation => demanderEntierPositif("Veuillez entrer la génération à partir de laquelle chercher : ")));
        elsif choice = "quitter" then
            Put_Line("Fin du programme");
        else
            Put_Line("Commande inconnue.");
         end if;
      exception
         when P_Arbre_Binaire_Personne.ArbreVideException => Put_Line("Erreur : l'arbre est vide.");
         when PersonneInconnueException => Put_Line("Erreur : la personne demandée est inconnue.");
         when PersonneDejaPresenteException => Put_Line("Erreur : une personne avec cet ID est déjà présente dans l'arbre.");
      end;

      New_Line;
      New_Line;

      if choice /= "quitter" then
         Put_Line("Appuyez sur Entrer pour continuer.");
         Skip_Line;
      end if;

      Put_Line("--------");
      New_Line;

      exit when choice = "quitter";
      end loop;

end interfacePrincipale;
