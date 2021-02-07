

# Rapport

## Introduction

Notre projet d'ADA est un jeu de plate-forme. Il utilise une librairie graphique GTKADA. Le but du jeu est de traverser la carte sans se faire tuer par les ennemis.

# ADA

## Procédures de build

Utiliser GNAT studio sur le fichier "***default.gpr***". Le projet a ete teste uniquement sur Windows avec GNAT studio.

### Dépendances

- GTKADA

## Manuel d'utilisation

Ouvrir le fichier "***default.gpr***" avec GNAT studio et lancer le projet sur le fichier "***src/main.adb***".

Pour lancer les tests il suffit de lancer le projet sur le fichier "***tests/test_main.adb***".

Pour ce deplacer dans le jeu, il suffit d'utiliser les fleches directionnelle du clavier et la barre d'espace pour sauter.

Pour faire pause il suffit d'appuyer sur la touche ***Echap***.

Lorsque l'on est mort ou que l'on a gagne il faut utiliser ***Enter*** pour relancer ou ***Echap*** pour quitter.


## Architecture du projet

- "***Blue/***", "***Green/***", "***Pink/***" dossier contenant les sprites pour les personnages et ennemis
- "***tests/***" dossier contenant les tests sur le projet.
- "***src/***" dossier contenant les fichiers sources du projet.
    - "***src/g_obj***" dossier contenant les sources du package GameObject et ses dérivés
	    - "***src/g_obj/block.ad****" package Block. Hérite de GameObject et contient les éléments liés aux blocks d'environnement (eau, sable, terre, ...)
	    - "***src/g_obj/foe.ad****" package Foe. Identique à Player mais pour les ennemis avec une procédure pour l'IA.
	    - "***src/g_obj/gameobject.ad****" package GameObject. Contient les éléments communs à tous les packages qui le dérivent (Block, Foe, Player).
	    - "***src/g_obj/player.ad****" package Player. Hérite de GameObject et contient les éléments liés au joueur (points de vie, sprites d'animation, ...).
    - "***src/anime.ad****" package Anime. Le package Anime sert de thread loop pour changer le sprite d'un GameObject et donc avoir des animations.
    -  "***src/file.ad****" package File. Le package File sert à faire toutes les actions sur un fichier (vérifier si il existe ou bien encore le lire).
    - "***src/graphics.ad****" package Graphics. Le package contient les fonctions haut niveau pour remplir un GTK_Widget.
    - "***src/inputevent.ad****" package InputEvent. Le package contient la fonction pour handle les keyboards event.
    - "***src/maps.ad****" package Maps. Le package contient tout ce qui est relatif à la hashmap dans laquelle on stock les blocs.
    - ...


# DO178C

## GNATtest

GNATtest n'étant plus disponible sur GNAT 2020 community Édition, nous avons implémenté nos propres tests en nous inspirant de cette [vidéo tutoriel de GNATtest](https://www.youtube.com/watch?v=CaiZ5IA3Vls)

## Exigence

| HLR | LLR |
|:-|:-|
| REQ.1 Se deplacer 		| REQ.1.1 Physique |
|                   		| REQ.1.2 Vecteur |
|                   		| REQ.1.3 InputEvent |
| REQ.2 Collision   		| REQ.2.1 Physique |
| REQ.3 Ouvrir des cartes	| REQ.3.1 Fichier |
| REQ.4 Menu et fin de jeu 	| REQ.4.1 Game loop |
| REQ.5 Combats				| REQ.5.1 Vie du joueur |
|							| REQ.5.2 Ennemi |
| REQ.6 Affichage			| REQ.6.1 Joueur, Ennemi et blocks |

<br/>

| LLR | Code |
|:-|:-|
| REQ.1.1 Physique      | ***physics.ads*** |
| REQ.1.2 Vecteur       | ***vector.ads*** |
| REQ.1.3 InputEvent    | ***inputevent.ads*** |
| REQ.2.1 Physique      | ***physics.ads*** |
| REQ.3.1 Fichier		| ***file.ads*** |
| REQ.4.1 Game loop		| ***main.ads, game.ads*** |
| REQ.5.1 Vie du joueur | ***player.ads, gameobject.ads*** |
| REQ.5.1 Ennemi		| ***foe.ads, gameobject.ads*** |
| REQ.6.1 Joueur, Ennemi et blocks | ***player.ads, foe.ads, maps.ads graphics.ads*** |


<br/>

# PPCO

## SPARK

Utilisant GTKADA que l'on a pas reussi a rendre compatible avec SPARK nous n'avons pas pu autant utiliser SPARK que nous le voulions. Nous l'avons quand meme fait sur les vecteurs et la physique. Nous l'avions fait sur d'autre fichier mais nous l'avons du le desactiver a cause de GTKADA.

Cependant nous avons ajouter un maximum de ***Pre*** et ***Post*** condition sur nos function et procedure.
