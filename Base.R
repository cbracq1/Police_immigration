# Base et recodage

if (!exists("indiv")) {
  indiv <- read_sas("C:/Users/Utilisateur/Documents/GitHub/Police_immigration/TeO2/SAS/indiv.sas7bdat",  catalog_file = "C:/Users/Utilisateur/Documents/GitHub/Police_immigration/TeO2/Doc/formats.sas7bcat")# ça c'est mon chemin, soit tu organises ton truc de la même manière comme ça ça marche pour nous deux soit il faut que tu fasses une autre commande
  #indiv <- read_sas("C:/Users/3e3gr/OneDrive/Documents/ENSAE/3A-S2/PDSSS2/database en sas/TeO2/SAS/indiv.sas7bdat")
  
  indiv <- to_factor(indiv)}

# ## Recodage
# 
# ok: 
#   i_cnfpol, i_cnfjus, i_ecole, i_contri, génération et origine (origine_tous_g2), 
# sexe (sexee), group1, sécurité du quartier(l_quart_secu),QPV (qpv_i), 
# présence d'immigrés dans le quartier (l_immi), relations dans le quartier (a_rquart), 
# f_dip plus haut diplôme, niveau socioéco (csnq_ego, csnq_premp premier emploi, uc_reve : Montant mensuel des ressources du ménage par unité de consommation en euros),
# durée de séjour [chiffre], âge (agenq) [chiffre])
# 
# à faire :
# 
# 
# plus complexe (ou pas) :
# i_controla [modalité], i_controlb[modalité]
# 
# i_opipol[non-diffusé]
# 
# Variables chiffrées : on peut les laisser comme ça, et selon les traitements créer des catégories après avoir checké la distribution
# 
# Modalité : 
# soit on veut créer une variable synthétique 
# (genre toutes les personnes qui ont dit oui à au moins un truc négatif ou qui ont au 
# moins pas coché un truc positif)
# soit on veut créer une variable par modalité


## Recodage de indiv$csnq_ego en indiv$csnq_ego_rec
indiv$csnq_ego_rec <- as.character(indiv$csnq_ego)
indiv$csnq_ego_rec <- fct_recode(indiv$csnq_ego_rec,
                                 "Jamais travaille ou hors champ" = "0",
                                 "Agriculteur" = "10",
                                 "Artisan / Commercant" = "20",
                                 "Cadre / profession liberale" = "30",
                                 "Profession intermediaire" = "40",
                                 "Employe qualifie" = "50",
                                 "Employe non qualifie" = "51",
                                 "Ouvrier qualifie" = "60",
                                 "Ouvrier non qualifie" = "61",
                                 "Refus ou ne sait pas ou incodable" = "90"
)

## Recodage de indiv$csnq_premp en indiv$csnq_premp_rec
indiv$csnq_premp_rec <- as.character(indiv$csnq_premp)
indiv$csnq_premp_rec <- fct_recode(indiv$csnq_premp_rec,
                                   "Jamais travaille ou hors champ" = "0",
                                   "Agriculteur" = "10",
                                   "Artisan / Commercant" = "20",
                                   "Cadre / profession liberale" = "30",
                                   "Profession intermédiaire" = "40",
                                   "Employe qualifie" = "50",
                                   "Employe non qualifie" = "51",
                                   "Ouvrier qualifie" = "60",
                                   "Ouvrier non qualifie" = "61",
                                   "Refus ou ne sait pas ou incodable" = "90"
)


## Recodage de indiv$f_dip en indiv$f_dip_rec
indiv$f_dip_rec <- as.character(indiv$f_dip)
indiv$f_dip_rec <- fct_recode(indiv$f_dip_rec,
                              "Aucun diplôme" = "1",
                              "CEP (certificat d'etudes primaires) ou diplôme etranger de même niveau" = "2",
                              "Brevet des colleges, BEPC, brevet elementaire ou diplôme etranger de même niveau" = "3",
                              "CAP, BEP ou diplôme de même niveau" = "4",
                              "Baccalaureat technologique ou professionnel ou diplôme de même niveau" = "5",
                              "Baccalaureat général, brevet supérieur, capacite en droit, DAEU ou diplôme étranger de même niveau" = "6",
                              "Diplôme de niveau BAC +1 ou +2" = "7",
                              "Diplôme de niveau supérieur à BAC + 2" = "8",
)



## Recodage de indiv$a_rquart en indiv$a_rquart_rec
indiv$a_rquart_rec <- as.character(indiv$a_rquart)
indiv$a_rquart_rec <- fct_recode(indiv$a_rquart_rec,
                                 "Presque tous" = "1",
                                 "Plus de la moitie" = "2",
                                 "La moitie" = "3",
                                 "Moins de la moitie" = "4",
                                 "Presque aucun ou aucun" = "5",
                                 "Refus ou ne sait pas" = "8",
                                 "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$i_cnfpol en indiv$i_cnfpol_rec
indiv$i_cnfpol_rec <- as.character(indiv$i_cnfpol)
indiv$i_cnfpol_rec <- fct_recode(indiv$i_cnfpol_rec,
                                 "Tout à fait confiance en la police" = "1",
                                 "Plutôt confiance en la police" = "2",
                                 "Plutôt pas confiance en la police" = "3",
                                 "Pas du tout confiance" = "4",
                                 "Refus ou ne sait pas" = "8",
                                 "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$i_ecole en indiv$i_ecole_rec
indiv$i_ecole_rec <- as.character(indiv$i_ecole)
indiv$i_ecole_rec <- fct_recode(indiv$i_ecole_rec,
                                "Tout à fait confiance en l'ecole" = "1",
                                "Plutôt confiance en l'ecole" = "2",
                                "Plutôt pas confiance en l'ecole" = "3",
                                "Pas du tout confiance en l'ecole" = "4",
                                "Refus ou ne sait pas" = "8",
                                "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$i_cnfjus en indiv$i_cnfjus_rec
indiv$i_cnfjus_rec <- as.character(indiv$i_cnfjus)
indiv$i_cnfjus_rec <- fct_recode(indiv$i_cnfjus_rec,
                                 "Tout à fait confiance en la justice" = "1",
                                 "Plutôt confiance en la justice" = "2",
                                 "Plutôt pas confiance en la justice" = "3",
                                 "Pas du tout confiance en la justice" = "4",
                                 "Refus ou ne sait pas" = "8",
                                 "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$i_contri en indiv$i_contri_rec
indiv$i_contri_rec <- as.character(indiv$i_contri)
indiv$i_contri_rec <- fct_recode(indiv$i_contri_rec,
                                 "Jamais" = "1",
                                 "Une seule fois" = "2",
                                 "De 2 à 5 fois" = "3",
                                 "Plus de 5 fois" = "4",
                                 "Refus ou ne sait pas" = "8",
                                 "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$sexee en indiv$sexee_rec
indiv$sexee_rec <- as.character(indiv$sexee)
indiv$sexee_rec <- fct_recode(indiv$sexee_rec,
                              "Masculin" = "1",
                              "Feminin" = "2"
)

## Recodage de indiv$group1 en indiv$group1_rec
indiv$group1_rec <- as.character(indiv$group1)
indiv$group1_rec <- fct_recode(indiv$group1_rec,
                               "Immigre (ne etranger à l'etranger y compris reintegres)" = "1",
                               "Originaire de l'Outre-mer" = "2",
                               "Descendant G2 d'un ou deux immigre(s)" = "3",
                               "Descendant G2 d'un ou deux originaire(s) d'outre-mer" = "4",
                               "Population non immigrée ni originaire d'Outre-mer et descendant de deux parents non immigrés et non originaires d'Outre-mer" = "5"
)

## Recodage de indiv$l_quart_secu en indiv$l_quart_secu_rec
indiv$l_quart_secu_rec <- as.character(indiv$l_quart_secu)
indiv$l_quart_secu_rec <- fct_recode(indiv$l_quart_secu_rec,
                                     "Bonne" = "1",
                                     "Moyenne" = "2",
                                     "Mauvaise" = "3",
                                     "Refus ou ne sait pa" = "8",
                                     "Refus ou ne sait pa" = "9"
)

## Recodage de indiv$qpv_i en indiv$qpv_i_rec
indiv$qpv_i_rec <- as.character(indiv$qpv_i)
indiv$qpv_i_rec <- fct_recode(indiv$qpv_i_rec,
                              "Oui" = "1",
                              "Non" = "0"
)

## Recodage de indiv$l_immi en indiv$l_immi_rec
indiv$l_immi_rec <- as.character(indiv$l_immi)
indiv$l_immi_rec <- fct_recode(indiv$l_immi_rec,
                               "Presque tous sont d'origine immigree" = "1",
                               "Plus de la moitie est d'origine immigree" = "2",
                               "La moitie est d'origine immigree" = "3",
                               "Moins de la moitie est d'origine immigree" = "4",
                               "Refus ou ne sait pas" = "8",
                               "Refus ou ne sait pas" = "9"
)

## Recodage de indiv$origine_tous_g2 en indiv$origine_tous_g2_rec
indiv$origine_tous_g2_rec <- as.character(indiv$origine_tous_g2)
indiv$origine_tous_g2_rec <- fct_recode(indiv$origine_tous_g2_rec,
                                        "Sans ascendance direct" = "0",
                                        "Autres français ne hors de France métro" = "10",
                                        "Descendants de français ne hors de France métro" = "11",
                                        "Originaires d'Outre-mer" = "20",
                                        "Descendants d'originaire(s) d'Outre-mer" = "22",
                                        "Immigres d'Algerie" = "30",
                                        "Descendants d'immigres(s) originaires d'Algerie" = "33",
                                        "Immigres du Maroc/Tunisie" = "40",
                                        "Descendants d'immigre(s) originaires du Maroc/Tunisie" = "44",
                                        "Immigres d'Afrique sahelienne" = "50",
                                        "Descendants d'immigre(s) originaires d'Afrique sahelienne" = "55",
                                        "Immigres d'Afrique guineenne/centrale" = "60",
                                        "Descendants d'immigre(s) originaires d'Afrique guineenne/centrale" = "66",
                                        "Immigres d'autres pays d'Afrique" = "70",
                                        "Descendants d'immigre(s) originaires d'autres pays d'Afrique" = "77",
                                        "Immigres d'Asie du Sud-est" = "80",
                                        "Descendants d'immigre(s) originaires d'Asie du Sud-est" = "88",
                                        "Immigres de Trurquie/Moyen-Orient" = "90",
                                        "Descendants d'immigre(s) originaires de Turquie/Moyen-Orient" = "99",
                                        "Immigres de Chine" = "100",
                                        "Immigres d'autres pays d'Asie" = "110",
                                        "Descendants d'immigre(s) originaires d'autres pays d'Asie" = "111",
                                        "Immigres du Portugal" = "120",
                                        "Descendants d'immigre(s) originaires du Portugal" = "121",
                                        "Immigres d'Espagne/Italie" = "130",
                                        "Descendants d'immigre(s) originaires d'Espagne/Italie" = "131",
                                        "Immigres d'autres pays de l'UE27" = "140",
                                        "Descendants d'immigre(s) originaires d'autres pays de l'UE27" = "141",
                                        "Immigres d'autres pays d'Europe" = "150",
                                        "Descendants d'immigre(s) originaires d'autres pays d'Europe" = "151",
                                        "Immigres d'autres pays" = "160",
                                        "Descendants d'immigre(s) originaires d'autres pays" = "161"
)


indiv_pd <- svydesign(ids = indiv$ident, data = indiv, weights = indiv$poidsi)
