package body P_Arbre_Genealogique is

   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique is
   begin
      return Arbre_Genealogique(P_Arbre_Binaire_Personne.creerArbreBinaire(laPersonne));
   end creerArbreGenealogique;

   procedure setPere(noeud: in Arbre_Genealogique; enfant: in Personne; pere: in Personne) is
   begin
      P_Arbre_Binaire_Personne.setEnfantGauche(
                                               P_Arbre_Binaire_Personne.Arbre_Binaire(noeud),
                                               enfant,
                                               pere
                                              );
   end setPere;
   
   procedure setPere(arbre: Arbre_Genealogique; idFils: in Integer; pere: in Personne) is
   begin
      setPere(arbre, creerPersonne(idFils), pere);
   end setPere;
   
   
   procedure setMere(noeud: in Arbre_Genealogique; enfant: in Personne; mere: in Personne) is
   begin
      P_Arbre_Binaire_Personne.setEnfantDroit(
                                              P_Arbre_Binaire_Personne.Arbre_Binaire(noeud),
                                              enfant,
                                              mere
                                             );
   end setMere;
   
   procedure setMere(arbre: Arbre_Genealogique; idFils: in Integer; mere: in Personne) is
   begin
      setMere(arbre, creerPersonne(idFils), mere);
   end setMere;
   

   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique is
   begin
      -- note : à remplacer par une map
      return Arbre_Genealogique(
                                P_Arbre_Binaire_Personne.getSousArbre(
                                  P_Arbre_Binaire_Personne.Arbre_Binaire(arbre), creerPersonne(id)
                                 )
                               );
   end getSousArbre;
   
   procedure afficher(arbre: in Arbre_Genealogique) is
   begin
      P_Arbre_Binaire_Personne.afficher(P_Arbre_Binaire_Personne.Arbre_Binaire(arbre));
   end afficher;
   
   procedure supprimerPersonneEtAncetres(arbre: in out Arbre_Genealogique; id: in Integer) is
   begin
      P_Arbre_Binaire_Personne.supprimerNoeud(
                                              P_Arbre_Binaire_Personne.Arbre_Binaire(arbre),
                                              creerPersonne(id)
                                                );
   end supprimerPersonneEtAncetres;
   
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer is
   begin
      return P_Arbre_Binaire_Personne.nombreNoeuds(P_Arbre_Binaire_Personne.Arbre_Binaire(arbre));
   end nombrePersonnes;
   
   
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee is
   begin
      return P_Arbre_Binaire_Personne.getNoeudsViaNombreEnfants(arbre          => arbre,
                                                                nombre_enfants => 1);
   end getPersonnesAvecUnSeulParent;
   
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee is
   begin
      return P_Arbre_Binaire_Personne.getNoeudsViaNombreEnfants(arbre          => arbre,
                                                                nombre_enfants => 2);
   end getPersonnesAvecDeuxParents;
   
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return P_Liste_Chainee_T.Liste_Chainee is
   begin
      return P_Arbre_Binaire_Personne.getNoeudsViaNombreEnfants(arbre          => arbre,
                                                                nombre_enfants => 0);
   end getPersonnesSansParent;
   

   function getAncetres(arbre: in Arbre_Binaire; noeud: in T; generation: Integer) return P_Liste_Chainee_T.Liste_Chainee is
   begin
      return P_Arbre_Binaire_Personne.getNoeudsApres(arbre      => arbre,
                                                     profondeur => generation);
   end getAncetres;
   
   function getDescendant(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return T is
   begin
      return P_Arbre_Binaire_Personne.getNoeudAvant(arbre      => arbre,
                                                    noeud      => noeud,
                                                    profondeur => profondeur);
   end getDescendant;
   
      
   function getDescendance(arbre: in Arbre_Binaire; noeud: in T; profondeur: in Integer) return P_Liste_Chainee_T.Liste_Chainee is
   begin
      return P_Arbre_Binaire_Personne.getSuccessionNoeudsAvant(arbre      => arbre,
                                                               noeud      => noeud,
                                                               profondeur => profondeur);
   end getDescendance;
   
   
end P_Arbre_Genealogique;
