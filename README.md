# Scouting Serie A. Système de similarité de joueurs

Projet personnel de recrutement sportif basé sur la donnée : collecte de statistiques publiques (Sofascore, Serie A, saison 2025/2026), construction d'un système qui calcule, pour n'importe quel joueur, ses profils statistiques les plus proches.

Méthode entièrement reproductible sur n'importe quel autre championnat, ou sur les données internes d'un club.

## Contexte

En formation d'analyste Business Intelligence orientée sport, je construis ce projet en totale autonomie pour démontrer une compétence concrète, utile au recrutement sportif. J'ai choisi la Serie A comme démonstrateur, faute d'accès aux données de championnats plus modestes, mais la méthode s'applique telle quelle à n'importe quel jeu de données de joueurs.

## Ce que fait le projet

1. Collecte automatisée des statistiques de tous les joueurs ayant disputé la saison 2025/2026 de Serie A (339 joueurs retenus, au moins 900 minutes jouées).
2. Conversion des statistiques en taux "par 90 minutes", pour comparer des rythmes de production plutôt que des totaux de saison.
3. Regroupement des joueurs par poste (Attaquant, Milieu, Défenseur, Gardien), chacun avec ses propres critères de comparaison pertinents.
4. Calcul d'un score de similarité statistique entre joueurs d'un même poste (similarité cosinus), converti en pourcentage de ressemblance.
5. Export vers une base de données MySQL, consultable via des vues SQL prêtes à l'emploi.

## Exemple de résultat

Recherche des joueurs les plus proches de Lautaro Martínez (Inter Milan) :

| Joueur | Équipe | Ressemblance |
|---|---|---|
| Marcus Thuram | Inter | 97,7 % |
| Nikola Krstović | Cagliari | 92,9 % |
| Rafael Leão | AC Milan | 91,6 % |


## Stack technique

- **Python** (pandas, scikit-learn, rapidfuzz) : collecte, nettoyage, calcul de similarité
- **cloudscraper** : contournement des protections anti-bot pour la collecte de données publiques
- **MySQL / phpMyAdmin** : stockage et consultation des résultats
- **SQL** : vues dédiées par poste, jointures, tri

## Contenu du dépôt

- `Scouting_propre.ipynb` : notebook complet, de la collecte des données jusqu'à l'export, commenté ligne par ligne
- `vues_sql.sql` : requêtes SQL des vues de consultation (une par poste)

## Limites actuelles et pistes d'amélioration

- Le découpage par poste reste large (4 catégories) ; un latéral offensif peut par exemple se retrouver classé parmi les milieux selon la catégorisation de la source de données.
- Le système ne distingue pas encore finement les styles de jeu au sein d'un même poste (ex : un ailier technique et un avant-centre physique partagent des statistiques de volume proches).
- Actuellement limité à la Serie A ; extensible à n'importe quel championnat ou aux données propres d'un club.

