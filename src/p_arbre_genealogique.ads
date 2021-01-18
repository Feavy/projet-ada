with P_Arbre_Binaire;
with P_Personne; use P_Personne;

package P_Arbre_Genealogique is
   
   --
   -- Levée si une personne n'existe pas dans l'arbre.
   --
   PersonneInconnueException: Exception;

   package P_Arbre_Binaire_Personne is new P_Arbre_Binaire(T               => P_Personne.Personne,
                                                           afficherContenu => P_Personne.afficher,
                                                           "="             => P_Personne."=");
   use P_Arbre_Binaire_Personne;
   type Arbre_Genealogique is new Arbre_Binaire;
   
   --
   -- Renvoie un nouvel arbre généalogique ayant comme racine la personne 'laPersonne'
   --
   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique;
   
   --
   -- Définit le père 'pere' de la personne 'enfant' contenue dans l'arbre 'arbre'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'enfant' n'est pas dans l'arbre.
   --
   procedure setPere(arbre: in Arbre_Genealogique; enfant: in Personne; pere: in Personne);
   --
   -- Définit le père 'pere' de la personne possédant l'ID 'idFils' contenue dans l'arbre 'arbre'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si la personne d'ID 'idFils' n'est pas dans l'arbre.
   --
   procedure setPere(arbre: in Arbre_Genealogique; idFils: in Integer; pere: in Personne);
   
   --
   -- Définit le mère 'mere' de la personne 'enfant' contenue dans l'arbre 'arbre'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'enfant' n'est pas dans l'arbre.
   --
   procedure setMere(arbre: in Arbre_Genealogique; enfant: in Personne; mere: in Personne);
   --
   -- Définit la mère 'mere' de la personne possédant l'ID 'idFils' contenue dans l'arbre 'arbre'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si la personne d'ID 'idFils' n'est pas dans l'arbre.
   --
   procedure setMere(arbre: in Arbre_Genealogique; idFils: in Integer; mere: in Personne);

   --
   -- Affiche l'arbre 'arbre'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   procedure afficher(arbre: in Arbre_Genealogique);
   --
   -- Affiche l'arbre 'arbre' à partir de la personne 'depart'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas la personne 'depart'.
   --
   procedure afficher(arbre: in Arbre_Genealogique; depart: in Personne);
   
   --
   -- Renvoie le sous-arbre de 'arbre' ayant pour racine la personne d'ID 'id'
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas de personne d'ID 'id'.
   --
   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique;
   
   --
   -- Renvoie le nombre de personnes contenues dans l'arbre 'arbre', 0 si l'arbre est vide.
   --
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer;
   
   --
   -- Renvoie le nombre d'ancêtres de la personne d'ID 'id' contenues dans l'arbre 'arbre'.
   --
   function nombreAncetres(arbre: in Arbre_Genealogique; id: in Integer) return Integer;
   
   --
   -- Supprime de l'arbre 'arbre' la personne d'ID 'id'.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas la personne 'depart'.
   --
   procedure supprimerPersonne(arbre: in out Arbre_Genealogique; id: in Integer);
   
   use P_Arbre_Binaire_Personne.P_Liste_Chainee_T;
   type Liste_Personne is new Liste_Chainee;
   
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant un seul parent connu.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return Liste_Personne;
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant deux parents connu.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return Liste_Personne;
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant aucun parent connu.
   -- Lève une ArbreVideException si l'arbre' est vide.
   --
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return Liste_Personne;

   --
   -- Renvoie la liste des ancêtres de la personne d'ID 'filsId' contenue dans l'arbre 'arbre'
   -- éloignés de 'generation' generations de lui.*
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas de personne d'ID 'filsID'.
   --
   function getAncetres(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne;
   --
   -- Renvoie le descendant de la personne d'ID 'filsId' contenue dans l'arbre 'arbre'
   -- éloigné de 'generation' generations de lui.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas de personne d'ID 'filsID' ou si le descendant est inconnu.
   --
   function getDescendant(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Personne;
   --
   -- Retourne la liste des descendants de la personne d'ID 'filsId' de l'arbre 'arbre'
   -- éloignés d'au moins 'generation' générations de lui.
   -- Lève une ArbreVideException si l'arbre' est vide.
   -- Lève une PersonneInconnueException si 'arbre' ne contient pas de personne d'ID 'filsID'.
   --
   function getDescendance(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne;
   
end P_Arbre_Genealogique;
