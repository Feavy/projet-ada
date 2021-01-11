with P_Arbre_Binaire;
with P_Personne; use P_Personne;

package P_Arbre_Genealogique is

   package P_Arbre_Binaire_Personne is new P_Arbre_Binaire(T               => P_Personne.Personne,
                                                           afficherContenu => P_Personne.afficher,
                                                           "="             => P_Personne."=");
   
   type Arbre_Genealogique is new P_Arbre_Binaire_Personne.Arbre_Binaire;
   
   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique;
   
   procedure setPere(noeud: in Arbre_Genealogique; enfant: in Personne; pere: in Personne);
   procedure setPere(arbre: in Arbre_Genealogique; idFils: in Integer; pere: in Personne);
   
   procedure setMere(noeud: in Arbre_Genealogique; enfant: in Personne; mere: in Personne);
   procedure setMere(arbre: in Arbre_Genealogique; idFils: in Integer; mere: in Personne);

   procedure afficher(arbre: in Arbre_Genealogique);
   
   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique;
   
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer;
   
   procedure supprimerPersonneEtAncetres(arbre: in out Arbre_Genealogique; id: in Integer);
   
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee;
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee;
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee;

   function getAncetres(arbre: in Arbre_Binaire; noeud: in T) return P_Liste_Chainee_T.Liste_Chainee;
   function getDescendant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T;
   function getDescendance(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return P_Liste_Chainee_T.Liste_Chainee;
   
end P_Arbre_Genealogique;
