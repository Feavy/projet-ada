package body P_Arbre_Genealogique is

   function creerArbreGenealogique(laPersonne: in Personne) return Arbre_Genealogique is
   begin
      return Arbre_Genealogique(P_Arbre_Binaire_Personne.creerArbreBinaire(laPersonne));
   end creerArbreGenealogique;

   procedure setPere(arbre: in Arbre_Genealogique; enfant: in Personne; pere: in Personne) is
   begin
      setEnfantGauche(Arbre_Binaire(arbre), enfant, pere);
   end setPere;
   
   procedure setPere(arbre: Arbre_Genealogique; idFils: in Integer; pere: in Personne) is
   begin
      setPere(arbre, creerPersonne(idFils), pere);
   end setPere;
   
   
   procedure setMere(arbre: in Arbre_Genealogique; enfant: in Personne; mere: in Personne) is
   begin
      setEnfantDroit(Arbre_Binaire(arbre), enfant, mere);
   end setMere;
   
   procedure setMere(arbre: Arbre_Genealogique; idFils: in Integer; mere: in Personne) is
   begin
      setMere(arbre, creerPersonne(idFils), mere);
   end setMere;
   

   function getSousArbre(arbre: in Arbre_Genealogique; id: in Integer) return Arbre_Genealogique is
   begin
      return Arbre_Genealogique(getSousArbre(Arbre_Binaire(arbre), creerPersonne(id)));
   end getSousArbre;
   
   procedure afficher(arbre: in Arbre_Genealogique) is
   begin
      afficher(Arbre_Binaire(arbre));
   end afficher;
   
   procedure afficher(arbre: in Arbre_Genealogique; depart: in Personne) is
   begin
      afficher(Arbre_Binaire(arbre), depart);
   end afficher;
   
   procedure supprimerPersonne(arbre: in out Arbre_Genealogique; id: in Integer) is
   begin
      supprimerNoeud(arbre => Arbre_Binaire(arbre),
                     noeud => creerPersonne(id));
   end supprimerPersonne;
   
   function nombrePersonnes(arbre: in Arbre_Genealogique) return Integer is
   begin
      return nombreNoeuds(Arbre_Binaire(arbre));
   end nombrePersonnes;
   
   
   function getPersonnesAvecUnSeulParent(arbre: in Arbre_Genealogique) return Liste_Personne is
   begin
      return Liste_Personne(getNoeudsViaNombreEnfants(arbre => Arbre_Binaire(arbre),
                                                      nombre_enfants => 1));
   end getPersonnesAvecUnSeulParent;
   
   function getPersonnesAvecDeuxParents(arbre: in Arbre_Genealogique) return Liste_Personne is
   begin
      return Liste_Personne(getNoeudsViaNombreEnfants(arbre => Arbre_Binaire(arbre),
                                                      nombre_enfants => 2));
   end getPersonnesAvecDeuxParents;
   
   function getPersonnesSansParent(arbre: in Arbre_Genealogique) return Liste_Personne is
   begin
      return Liste_Personne(getNoeudsViaNombreEnfants(arbre => Arbre_Binaire(arbre),
                                                      nombre_enfants => 0));
   end getPersonnesSansParent;
   

   function getAncetres(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne is
   begin
      return Liste_Personne(getNoeudsApres(arbre      => Arbre_Binaire(getSousArbre(arbre, filsId)),
                                           profondeur => generation));
   end getAncetres;
   
   function getDescendant(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Personne is
   begin
      return getNoeudAvant(arbre      => Arbre_Binaire(arbre),
                           noeud      => creerPersonne(filsId),
                           profondeur => generation);
   exception
         when NoeudInexistantException => raise PersonneInconnueException;
   end getDescendant;
   
      
   function getDescendance(arbre: in Arbre_Genealogique; filsId: in Integer; generation: in Integer) return Liste_Personne is
   begin
      return Liste_Personne(getSuccessionNoeudsAvant(arbre      => Arbre_Binaire(arbre),
                                                     noeud      => creerPersonne(filsId),
                                                     profondeur => generation));
   end getDescendance;
   
   
end P_Arbre_Genealogique;
