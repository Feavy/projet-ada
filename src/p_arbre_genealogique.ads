with P_Arbre_Binaire;
with P_Personne; use P_Personne;

package P_Arbre_Genealogique is

   package P_Arbre_Binaire_Personne is new P_Arbre_Binaire(T               => P_Personne.Personne,
                                                           afficherContenu => P_Personne.afficher,
                                                           "="             => P_Personne."=");
   use P_Arbre_Binaire_Personne;
   type Arbre_Genealogique is new Arbre_Binaire;
   
   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique;
   
   procedure setPere(noeud: in Arbre_Genealogique; enfant: in Personne; pere: in Personne);
   procedure setPere(arbre: in Arbre_Genealogique; idFils: in Integer; pere: in Personne);
   
   procedure setMere(noeud: in Arbre_Genealogique; enfant: in Personne; mere: in Personne);
   procedure setMere(arbre: in Arbre_Genealogique; idFils: in Integer; mere: in Personne);

   procedure afficher(arbre: in Arbre_Genealogique);
   procedure afficher(arbre: in Arbre_Genealogique; depart: in Personne);
   
   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique;
   
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer;
   
   procedure supprimerPersonne(arbre: in out Arbre_Genealogique; id: in Integer);
   
   use P_Arbre_Binaire_Personne.P_Liste_Chainee_T;
   type Liste_Personne is new Liste_Chainee;
   
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return Liste_Personne;
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return Liste_Personne;
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return Liste_Personne;

   function getAncetres(arbre: in Arbre_Genealogique; fildId: in Integer; generation: in Integer) return Liste_Personne;
   function getDescendant(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Personne;
   function getDescendance(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne;
   
end P_Arbre_Genealogique;
