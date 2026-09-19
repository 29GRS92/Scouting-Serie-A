-- Vues SQL du projet "Scouting Serie A".
-- Chaque vue joint la table `joueurs` (statistiques complètes) et `similarites`
-- (table longue joueur / joueur_compare / pourcentage_ressemblance / poste),
-- pour ne montrer, par poste, que les colonnes pertinentes au calcul de similarité,
-- triées par pourcentage de ressemblance décroissant.

CREATE OR REPLACE VIEW vue_similarite_attaquants AS
SELECT
    j.name AS joueur,
    s.pourcentage_ressemblance,
    s.joueur AS joueur_recherche,
    LEFT(j.dateOfBirth, 4) AS annee_naissance,
    j.team AS equipe,
    j.minutesPlayed AS minutes_jouees,
    j.appearances AS matchs_joues,
    j.matchesStarted AS titularisations,
    j.goals AS buts,
    j.assists AS passes_decisives,
    j.accuratePassesPercentage AS pourcentage_passes_reussies,
    ROUND(j.goals_per90, 2) AS buts_par90,
    ROUND(j.expectedGoals_per90, 2) AS xg_par90,
    ROUND(j.assists_per90, 2) AS passes_d_par90,
    ROUND(j.bigChancesCreated_per90, 2) AS grosses_occasions_par90,
    ROUND(j.totalShots_per90, 2) AS tirs_par90,
    ROUND(j.shotsOnTarget_per90, 2) AS tirs_cadres_par90,
    ROUND(j.successfulDribbles_per90, 2) AS dribbles_reussis_par90,
    ROUND(j.keyPasses_per90, 2) AS passes_cles_par90,
    ROUND(j.accuratePasses_per90, 2) AS passes_reussies_par90,
    ROUND(j.totalPasses_per90, 2) AS passes_tentees_par90,
    ROUND(j.aerialDuelsWon_per90, 2) AS duels_aeriens_gagnes_par90,
    ROUND(j.groundDuelsWon_per90, 2) AS duels_sol_gagnes_par90,
    ROUND(j.touches_per90, 2) AS touches_par90
FROM similarites s
JOIN joueurs j ON s.joueur_compare = j.name
WHERE s.poste = 'Attaquant'
ORDER BY s.joueur, s.pourcentage_ressemblance DESC;


CREATE OR REPLACE VIEW vue_similarite_milieux AS
SELECT
    j.name AS joueur,
    s.pourcentage_ressemblance,
    s.joueur AS joueur_recherche,
    LEFT(j.dateOfBirth, 4) AS annee_naissance,
    j.team AS equipe,
    j.minutesPlayed AS minutes_jouees,
    j.appearances AS matchs_joues,
    j.matchesStarted AS titularisations,
    j.goals AS buts,
    j.assists AS passes_decisives,
    j.yellowCards AS cartons_jaunes,
    j.redCards AS cartons_rouges,
    j.fouls AS fautes,
    j.accuratePassesPercentage AS pourcentage_passes_reussies,
    ROUND(j.goals_per90, 2) AS buts_par90,
    ROUND(j.expectedGoals_per90, 2) AS xg_par90,
    ROUND(j.assists_per90, 2) AS passes_d_par90,
    ROUND(j.expectedAssists_per90, 2) AS xa_par90,
    ROUND(j.bigChancesCreated_per90, 2) AS grosses_occasions_par90,
    ROUND(j.shotsOnTarget_per90, 2) AS tirs_cadres_par90,
    ROUND(j.keyPasses_per90, 2) AS passes_cles_par90,
    ROUND(j.accuratePasses_per90, 2) AS passes_reussies_par90,
    ROUND(j.totalPasses_per90, 2) AS passes_tentees_par90,
    ROUND(j.accurateLongBalls_per90, 2) AS longs_ballons_reussis_par90,
    ROUND(j.successfulDribbles_per90, 2) AS dribbles_reussis_par90,
    ROUND(j.touches_per90, 2) AS touches_par90,
    ROUND(j.tackles_per90, 2) AS tacles_par90,
    ROUND(j.interceptions_per90, 2) AS interceptions_par90,
    ROUND(j.blockedShots_per90, 2) AS tirs_contres_par90,
    ROUND(j.groundDuelsWon_per90, 2) AS duels_sol_gagnes_par90,
    ROUND(j.aerialDuelsWon_per90, 2) AS duels_aeriens_gagnes_par90
FROM similarites s
JOIN joueurs j ON s.joueur_compare = j.name
WHERE s.poste = 'Milieu'
ORDER BY s.joueur, s.pourcentage_ressemblance DESC;


CREATE OR REPLACE VIEW vue_similarite_defenseurs AS
SELECT
    j.name AS joueur,
    s.pourcentage_ressemblance,
    s.joueur AS joueur_recherche,
    LEFT(j.dateOfBirth, 4) AS annee_naissance,
    j.team AS equipe,
    j.minutesPlayed AS minutes_jouees,
    j.appearances AS matchs_joues,
    j.matchesStarted AS titularisations,
    j.goals AS buts,
    j.assists AS passes_decisives,
    j.yellowCards AS cartons_jaunes,
    j.redCards AS cartons_rouges,
    j.fouls AS fautes,
    j.accuratePassesPercentage AS pourcentage_passes_reussies,
    j.aerialDuelsWonPercentage AS pourcentage_duels_aeriens_gagnes,
    ROUND(j.goals_per90, 2) AS buts_par90,
    ROUND(j.expectedGoals_per90, 2) AS xg_par90,
    ROUND(j.assists_per90, 2) AS passes_d_par90,
    ROUND(j.expectedAssists_per90, 2) AS xa_par90,
    ROUND(j.tackles_per90, 2) AS tacles_par90,
    ROUND(j.tacklesWon_per90, 2) AS tacles_reussis_par90,
    ROUND(j.interceptions_per90, 2) AS interceptions_par90,
    ROUND(j.clearances_per90, 2) AS degagements_par90,
    ROUND(j.blockedShots_per90, 2) AS tirs_contres_par90,
    ROUND(j.aerialDuelsWon_per90, 2) AS duels_aeriens_gagnes_par90,
    ROUND(j.groundDuelsWon_per90, 2) AS duels_sol_gagnes_par90,
    ROUND(j.accuratePasses_per90, 2) AS passes_reussies_par90,
    ROUND(j.successfulDribbles_per90, 2) AS dribbles_reussis_par90,
    ROUND(j.keyPasses_per90, 2) AS passes_cles_par90,
    ROUND(j.touches_per90, 2) AS touches_par90
FROM similarites s
JOIN joueurs j ON s.joueur_compare = j.name
WHERE s.poste = 'Défenseur'
ORDER BY s.joueur, s.pourcentage_ressemblance DESC;


CREATE OR REPLACE VIEW vue_similarite_gardiens AS
SELECT
    j.name AS joueur,
    s.pourcentage_ressemblance,
    s.joueur AS joueur_recherche,
    LEFT(j.dateOfBirth, 4) AS annee_naissance,
    j.team AS equipe,
    j.minutesPlayed AS minutes_jouees,
    j.appearances AS matchs_joues,
    j.matchesStarted AS titularisations,
    j.cleanSheet AS clean_sheets,
    ROUND(j.saves_per90, 2) AS arrets_par90,
    ROUND(j.goalsConceded_per90, 2) AS buts_encaisses_par90,
    ROUND(j.penaltySave_per90, 2) AS penalties_arretes_par90
FROM similarites s
JOIN joueurs j ON s.joueur_compare = j.name
WHERE s.poste = 'Gardien'
ORDER BY s.joueur, s.pourcentage_ressemblance DESC;
