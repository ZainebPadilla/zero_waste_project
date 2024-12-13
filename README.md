
Description
Projet de Plateforme de Discussion et d'Analyse Communautaire sur les Cryptomonnaies

1 Présentation :

Ce projet consiste à développer une plateforme web dédiée aux passionnés de cryptomonnaies. L'objectif est de permettre aux utilisateurs de suivre les tendances de différentes cryptomonnaies, de partager leur sentiment sur les mouvements du marché, et de participer à des discussions sous chaque actif. Pour une interaction plus authentique et engageante, seuls les utilisateurs connectés pourront voter et commenter.

Fonctionnalités principales :

Affichage des informations de marché pour chaque cryptomonnaie, incluant les graphiques en temps réel grâce à l’intégration de TradingView.
Système de vote communautaire pour indiquer le sentiment des utilisateurs sur la direction du marché de chaque cryptomonnaie (vote "Up" ou "Down" pour les prochaines 24 heures).
Section de discussion sous chaque cryptomonnaie pour permettre aux utilisateurs de partager des analyses et des opinions.
Fonctionnalité de favoris pour que les utilisateurs puissent suivre leurs cryptomonnaies préférées et recevoir des notifications pertinentes.
2 User Stories :

2.1 Visiteur non connecté :

Accès aux informations générales et aux graphiques des cryptomonnaies.
Lecture des discussions existantes.
Ne peut pas voter ni commenter tant qu'il n'est pas connecté.
2.2 Utilisateur connecté (Membre de la communauté) :

Peut voter (Up/Down) pour chaque cryptomonnaie, exprimant un sentiment de marché pour une durée de 24 heures.
Accès à une section de discussion sous chaque cryptomonnaie pour interagir avec la communauté.
Peut ajouter des cryptomonnaies à sa liste de favoris pour un suivi personnalisé.
2.3 Administrateur :

Gestion de la liste des cryptomonnaies et possibilité d’ajouter ou de supprimer des actifs.
Visualisation de l'activité des membres pour garantir un bon fonctionnement de la plateforme.
3 Concrètement et techniquement

3.1. Base de données

Les tables principales et leurs relations incluront :

Utilisateurs : Informations de base, telles que Pseudo (utilisé pour rattacher les discussions à l'utilisateur), email, rôle (utilisateur ou administrateur), et état de connexion.
Cryptomonnaies : Informations de chaque cryptomonnaie, incluant le nom, le symbole, le prix actuel et les variations.
Votes de sentiment : Table enregistrant les votes de chaque utilisateur pour chaque cryptomonnaie. Limitation d’un vote par utilisateur et par cryptomonnaie toutes les 24 heures.
Discussions : Table des commentaires associés à chaque cryptomonnaie, permettant de suivre les échanges.
Favoris : Pour permettre aux utilisateurs de marquer les cryptomonnaies qu’ils souhaitent suivre de plus près.
Relations entre tables :

Relation Utilisateurs-Votes : Permet de restreindre chaque utilisateur à un vote par cryptomonnaie et par jour.
Relation Utilisateurs-Discussions : Associe chaque commentaire à l’utilisateur qui l’a posté.
Relation Utilisateurs-Favoris : Permet aux utilisateurs de suivre leurs cryptomonnaies préférées et d'ajouter la quantité qu'ils possèdent pour chaque crypto.
3.2. Frontend

L’interface utilisateur est conçue pour être moderne, ergonomique et attrayante :

Tableau de bord dynamique et interactif : Mise en avant des cryptomonnaies les plus populaires, affichage des tendances de vote, et des notifications en temps réel.
Système de vote de sentiment : Boutons de vote (Up/Down) avec affichage de la tendance actuelle de la communauté (pourcentage de votes positifs et négatifs).
Intégration de graphiques TradingView : Pour un suivi en temps réel des performances de chaque cryptomonnaie.
Section Discussions : Pour chaque cryptomonnaie, une section de commentaires dynamique, où les utilisateurs connectés peuvent poster des messages et interagir avec les autres membres.
Section Favoris : Un espace où les utilisateurs peuvent suivre leurs cryptomonnaies préférées, avec des alertes en cas de fortes variations de prix ou de changement de tendance communautaire.
3.3. Backend

Le backend sera développé en Ruby on Rails, avec les technologies suivantes :

Rails : Utilisé pour la gestion des requêtes utilisateur, la logique métier, et les fonctionnalités essentielles.
API de cryptomonnaies : Intégration d’API externes comme CoinGecko pour récupérer les données en temps réel, et TradingView pour afficher les graphiques.
4 Besoins techniques

Pour compléter ce projet, l’équipe nécessitera les compétences suivantes :

Développement Frontend : Expertise en JavaScript et CSS pour créer un tableau de bord interactif et intégrer les widgets TradingView.
Développement Backend : Connaissance de Ruby on Rails pour la gestion des fonctionnalités principales et l'authentification.
UI/UX Design : Un designer pour optimiser l’interface utilisateur, la rendant ergonomique et visuellement attrayante.
Gestion de bases de données : Structurer les tables et assurer les relations pour des opérations efficaces entre utilisateurs, votes, et discussions.
5 Version minimaliste mais fonctionnelle (MVP)

Pour le MVP (Minimum Viable Product), les fonctionnalités essentielles seront :

Tableau de bord : Affichage des informations clés sur les cryptomonnaies et des graphiques en temps réel.
Inscription et connexion utilisateur : Pour permettre aux utilisateurs de voter et de commenter.
Section Discussions : Possibilité de commenter sous chaque cryptomonnaie.
6 Modération des Messages

La plateforme utilisera des expressions régulières (Regex) pour filtrer automatiquement les messages inappropriés avant leur publication. Dès qu'un utilisateur soumet un message, il sera analysé en temps réel pour détecter des mots ou expressions offensants (insultes, spam, etc.). Si un terme interdit est trouvé, le message sera bloqué immédiatement, et l'utilisateur sera averti de la violation.

Cette méthode permettra de garantir un environnement de discussion respectueux sans retarder l'interaction des utilisateurs.

7 Version finale présentée aux jurys

Pour la version finale, des fonctionnalités avancées seront ajoutées, notamment :

Historique des votes de sentiment : Pour que les utilisateurs consultent les tendances de vote de la communauté.
Notifications en temps réel : Alertes en fonction des variations de prix pour les cryptomonnaies en favoris.
Analyses de tendances : Affichage des tendances générales de la communauté pour offrir une vision d'ensemble.
Section Favoris : Gestion des cryptomonnaies favorites pour chaque utilisateur.
8 Notre Mentor

Mentor : Mickaël Gervais

Pourquoi rejoindre ce projet
Ce projet n’est pas simplement un exercice technique, mais une opportunité de contribuer à une communauté active de passionnés de cryptomonnaies. Vous pourrez travailler avec des technologies modernes et acquérir de l’expérience en développement fullstack avec un impact réel.

En rejoignant cette équipe, vous aurez l’occasion d’explorer :

Le développement backend avec Ruby on Rails pour la gestion des données et des utilisateurs. Le frontend interactif avec des composants en JavaScript et CSS. L'intégration d’API en temps réel, pour suivre les évolutions d’un marché dynamique. Ce projet sera un atout majeur pour votre portfolio, avec un produit final fonctionnel et engageant.

En participant à ce projet, vous rejoignez une aventure collaborative, enrichissante et à impact réel.