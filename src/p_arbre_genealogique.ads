with P_Arbre_Binaire;
with P_Personne; use P_Personne;

package P_Arbre_Genealogique is
   
   --
   -- Lev�e si une personne n'existe pas dans l'arbre.
   --
   PersonneInconnueException: Exception;

   package P_Arbre_Binaire_Personne is new P_Arbre_Binaire(T               => P_Personne.Personne,
                                                           afficherContenu => P_Personne.afficher,
                                                           "="             => P_Personne."=");
   use P_Arbre_Binaire_Personne;
   type Arbre_Genealogique is new Arbre_Binaire;
   
   --
   -- Renvoie un nouvel arbre g�n�alogique ayant comme racine la personne 'laPersonne'
   --
   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique;
   
   --
   -- D�finit le p�re 'pere' de la personne 'enfant' contenue dans l'arbre 'arbre'.
   --
   procedure setPere(arbre: in Arbre_Genealogique; enfant: in Personne; pere: in Personne);
   --
   -- D�finit le p�re 'pere' de la personne poss�dant l'ID 'idFils' contenue dans l'arbre 'arbre'.
   --
   procedure setPere(arbre: in Arbre_Genealogique; idFils: in Integer; pere: in Personne);
   
   --
   -- D�finit le m�re 'mere' de la personne 'enfant' contenue dans l'arbre 'arbre'.
   --
   procedure setMere(arbre: in Arbre_Genealogique; enfant: in Personne; mere: in Personne);
   --
   -- D�finit la m�re 'mere' de la personne poss�dant l'ID 'idFils' contenue dans l'arbre 'arbre'.
   --
   procedure setMere(arbre: in Arbre_Genealogique; idFils: in Integer; mere: in Personne);

   --
   -- Affiche l'arbre 'arbre'.
   --
   procedure afficher(arbre: in Arbre_Genealogique);
   --
   -- Affiche l'arbre 'arbre' � partir de la personne 'depart'
   --
   procedure afficher(arbre: in Arbre_Genealogique; depart: in Personne);
   
   --
   -- Renvoie le sous-arbre de 'arbre' ayant pour racine la personne d'ID 'id'
   --
   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique;
   
   --
   -- Renvoie le nombre de personnes contenues dans l'arbre 'arbre'.
   --
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer;
   
   --
   -- Supprime de l'arbre 'arbre' la personne d'ID 'id'.
   --
   procedure supprimerPersonne(arbre: in out Arbre_Genealogique; id: in Integer);
   
   use P_Arbre_Binaire_Personne.P_Liste_Chainee_T;
   type Liste_Personne is new Liste_Chainee;
   
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant un seul parent connu.
   --
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return Liste_Personne;
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant deux parents connu.
   --
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return Liste_Personne;
   --
   -- Renvoie la liste des personnes de l'arbre 'arbre' ayant aucun parent connu.
   --
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return Liste_Personne;

   --
   -- Renvoie la liste des anc�tres de la personne d'ID 'filsId' contenue dans l'arbre 'arbre'
   -- �loign�s de 'generation' generations de lui.
   --
   function getAncetres(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne;
   --
   -- Renvoie le descendant de la personne d'ID 'filsId' contenue dans l'arbre 'arbre'
   -- �loign� de 'generation' generations de lui.
   -- L�ve une exception PersonneInconnueException si le descendant est inconnu.
   --
   function getDescendant(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Personne;
   --
   -- Retourne la liste des descendants de la personne d'ID 'filsId' de l'arbre 'arbre'
   -- �loign�s d'au moins 'generation' g�n�rations de lui.
   --
   function getDescendance(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne;
   
end P_Arbre_Genealogique;
