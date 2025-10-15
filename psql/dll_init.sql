/*
MOIS;ANNEE;DR;IDD;BRIGADES;WILAYA;COLLABORATION;localisation geographique(e);localisation geographique(n);toponymie;date;heure;"Armes
 (Unité)";TYPES D'ARMES;"Munitions
(Unité)";" Equipements
sensibles  (mètres)";"Produits et équipements
sensibles  (Unité)";"Stupéfiants
 kif traité
 (KG)
";"CocaÏne
 (KG)
";"Produits
psychotropes
(comprimé) ";Discription du produit2;"Cigaretttes
(Unité)  ";"Tabac
(KG)";"Alcool
et
Spiritueux
 (Litre)";"Carburants
 (Litre)";produits alimentaires de large consommation (KG);produits alimentaires de large consommation (Litre)

 */
/*
MOIS,ANNEE,DR,IDD,BRIGADES,WILAYA,COLLABORATION,localisation_geographique_e,localisation_geographique_n,toponymie,date,heure,Armes_Unite,TYPES_D_ARMES,Munitions_Unite,Equipements_sensibles_metres,Produits_et_equipements_sensibles_Unite,Stupefiants_kif_traite_KG,Cocaine_KG,Produits_psychotropes_comprime,Discription_du_produit2,Cigarettes_Unite,Tabac_KG,Alcool_et_Spiritueux_Litre,Carburants_Litre,produits_alimentaires_de_large_consommation_KG,produits_alimentaires_de_large_consommation_Litre
*/

Shortened CSV Header

mois,annee,dr,idd,brigade,wilaya,collab,loc_e,loc_n,topo,date,heure,armes_u,type_armes,mun_u,equip_sens_m,equip_sens_u,kif_kg,coc_kg,psy_compr,desc_prod,cig_u,tab_kg,alc_l,carb_l,alim_kg,alim_l

create schema rend25;

CREATE TABLE rend25.rendement_ (
                                  id SERIAL PRIMARY KEY,
                                  mois TEXT,
                                  annee TEXT,
                                  dr TEXT,
                                  idd TEXT,
                                  brigade TEXT,
                                  wilaya TEXT,
                                  collab TEXT,
                                  loc_e TEXT,
                                  loc_n TEXT,
                                  topo TEXT,
                                  date TEXT,
                                  heure TEXT,
                                  armes_u TEXT,
                                  type_armes TEXT,
                                  mun_u TEXT,
                                  equip_sens_m TEXT,
                                  equip_sens_u TEXT,
                                  kif_kg TEXT,
                                  coc_kg TEXT,
                                  psy_compr TEXT,
                                  desc_prod TEXT,
                                  cig_u TEXT,
                                  tab_kg TEXT,
                                  alc_l TEXT,
                                  carb_l TEXT,
                                  alim_kg TEXT,
                                  alim_l TEXT
);

CREATE TABLE rend25.rendement (
                               id SERIAL PRIMARY KEY,
                               mois VARCHAR(10),
                               annee INT,
                               dr VARCHAR(50),
                               idd VARCHAR(50),
                               brigade VARCHAR(100),
                               wilaya VARCHAR(100),
                               collab VARCHAR(255),
                               loc_e NUMERIC(10,6),
                               loc_n NUMERIC(10,6),
                               topo VARCHAR(255),
                               date DATE,
                               heure TIME,
                               armes_u INT,
                               type_armes VARCHAR(255),
                               mun_u INT,
                               equip_sens_m NUMERIC(12,2),
                               equip_sens_u INT,
                               kif_kg NUMERIC(12,3),
                               coc_kg NUMERIC(12,3),
                               psy_compr INT,
                               desc_prod TEXT,
                               cig_u BIGINT,
                               tab_kg NUMERIC(12,2),
                               alc_l NUMERIC(12,2),
                               carb_l NUMERIC(12,2),
                               alim_kg NUMERIC(12,2),
                               alim_l NUMERIC(12,2)
);
