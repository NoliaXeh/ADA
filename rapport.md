# Rapport

## Introduction

Notre projet d'ADA est un jeu de plate-forme. Il utilise une librairie graphique GTKADA. Le but du jeu est de traverser la carte sans se faire tuer par les ennemis.

# ADA

## Procédures de build

Utiliser GNAT studio sur le fichier "***default.gpr***".

### Dépendances

- GTKADA

## Manuel d'utilisation

Ouvrir le fichier "***default.gpr***" avec GNAT studio et lancer le projet sur le fichier "***src/main.adb***".

Pour lancer les tests il suffit de lancer le projet sur le fichier "***tests/test_main.adb***".

## Architecture du projet

- "***Blue/***", "***Green/***", "***Pink/***" dossier contenant les sprites pour les personnages et enemis
- "***tests/***" dossier contenant les tests sur le projet.
- "***src/***" dossier contenant les fichiers sources du projet.
    - ...
    - ...

# DO178C

## GNATtest

GNATtest n'étant plus disponible sur GNAT 2020 community Édition, nous avons implémenté nos propres tests en nous inspirant de cette [vidéo tutoriel de GNATtest](https://www.youtube.com/watch?v=CaiZ5IA3Vls)

## Exigence

| HLR | LLR |
|:-|:-|
| REQ.1 Se deplacer | REQ.1.1 Physique |
|                   | REQ.1.2 Vecteur |
|                   | REQ.1.3 InputEvent |
| REQ.2 Collision   | REQ.2.1 Physique |

<br/>

| LLR | Code |
|:-|:-|
| REQ.1.1 Physique      | ***physics.ads*** |
| REQ.1.2 Vecteur       | ***vector.ads*** |
| REQ.1.3 InputEvent    | ***inputevent.ads*** |
| REQ.2.1 Physique      | ***physics.ads*** |

<br/>

# PPCO

***Pre*** et ***Post*** condition ajouter plein de fois