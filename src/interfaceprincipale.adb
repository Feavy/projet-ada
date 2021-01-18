with Ada.Text_IO; use Ada.Text_IO;
with P_Var_String; use P_Var_String;

with p_interface_utils; use p_interface_utils;
with P_Arbre_Genealogique; use P_Arbre_Genealogique;

with P_Personne; use P_Personne;

procedure interfacePrincipale is
   choice: T_Var_String;
   arbre: Arbre_Genealogique;
   compte: Integer;
begin
   loop
      Put_Line(" [Commandes] ");
      Put_Line("creer : Cr�er un nouvel arbre g�n�aologique.");
      Put_Line("setPere : D�finir le p�re d'une personne de l'arbre.");
      Put_Line("setMere : D�finir la m�re d'une personne de l'arbre.");
      Put_Line("supprimer : Supprimer une personne et ses anc�tres de l'arbre.");
      Put_Line("afficher : Affiche l'arbre � partir d'un noeud donn�.");
      Put_Line("sansParent : Affiche l'ensemble des individus qui n'ont pas de parent connu.");
      Put_Line("unParent : Affiche l'ensemble des individus qui n'ont qu'un parent connu.");
      Put_Line("deuxParents : Affiche l'ensemble des individus qui ont deux parents connus.");
      Put_Line("nombreAncetres : Affiche le nombre d'anc�tres d'une personne (elle compris).");
      Put_Line("ancetres : Affiche l'ensemble des anc�tres situ�s � une certaine g�n�ration d'une personne donn�e.");
      Put_Line("ancetres2 : Affiche la succession d'anc�tres d'une g�n�ration donn�e pour un noeud donn�.");
      Put_Line("descendant : Affiche le descendant d'une personne donn� situ� � une g�n�ration donn�e.");
      Put_Line("descendance : Affiche la succession de descendants d'une personne donn�e � partir d'une certaine g�n�ration.");
      Put_Line("quitter : Quitte le programme");
      New_Line;
      Put_Line("Votre choix :");
      Get(choice);
      New_Line;
      begin
        if choice = "creer" then
            arbre := creerArbreGenealogique(laPersonne => demanderPersonne("Personne racine :"));
            Put_Line("L'arbre a bien �t� cr��.");
        elsif choice = "setPere" then
            setPere(arbre  => arbre,
                    idFils => demanderEntierPositif("ID de l'enfant :"),
                    pere   => demanderPersonne("P�re � d�finir :"));
            Put_Line("Le p�re a bien �t� d�fini.");

        elsif choice = "setMere" then
            setMere(arbre  => arbre,
                    idFils => demanderEntierPositif("ID de l'enfant :"),
                    mere   => demanderPersonne("M�re � d�finir :"));
            Put_Line("La m�re a bien �t� d�finie.");
        elsif choice = "supprimer" then
            supprimerPersonne(arbre => arbre,
                            id    => demanderEntierPositif("ID de la personne � supprimer "));
            Put_Line("La personne et ses anc�tres ont bien �t� supprim�s.");
        elsif choice = "nombreAncetres" then
            compte := nombreAncetres(arbre => arbre,
                                     id    => demanderEntierPositif("ID de la personne dont compter les anc�tres :"));

            Put_Line("Nombre d'anc�tres : " & compte'Image);
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
            afficher(getAncetres(arbre      => arbre,
                                filsId     => demanderEntierPositif("ID de la personne dont chercher l'anc�tre :"),
                                generation => demanderEntierPositif("G�n�ration :")));
        elsif choice = "ancetres2" then
            Put_Line("A faire");
        elsif choice = "descendant" then
            afficher(getDescendant(arbre      => arbre,
                        filsId     => demanderEntierPositif("ID de la personne dont chercher le descendant : "),
                        generation => demanderEntierPositif("G�n�ration ")));
        elsif choice = "descendance" then
            afficher(getDescendance(arbre      => arbre,
                            filsId     => demanderEntierPositif("ID de la personne dont chercher la descendance : "),
                            generation => demanderEntierPositif("G�n�ration � partir de laquelle chercher : ")));
        elsif choice = "quitter" then
            Put_Line("Fin du programme");
        else
            Put_Line("Commande inconnue.");
         end if;
      exception
         when P_Arbre_Binaire_Personne.ArbreVideException => Put_Line("Erreur : l'arbre est vide.");
         when PersonneInconnueException => Put_Line("Erreur : la personne demand�e est inconnue.");
      end;

      if choice /= "quitter" then
         Put_Line("Appuyez sur Entrer pour continuer.");
         Skip_Line;
      end if;

      exit when choice = "quitter";
      end loop;

end interfacePrincipale;
