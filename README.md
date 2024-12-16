
1. Présentation
Les entreprises, y compris dans le secteur de la restauration, sont de plus en plus conscientes des impacts environnementaux de leur activité. Cependant, le suivi précis du gaspillage des matières premières et des émissions de CO₂ associées reste un défi majeur. L'application permet de répondre à cette problématique en fournissant une solution pour mesurer, analyser et réduire ces impacts.

L'application permet aux entreprises de suivre les matières premières (quantités entrantes, consommées, et gaspillées), de calculer automatiquement les émissions de CO₂ associées aux déchets générés, et d'offrir des indicateurs clés de performance environnementale. L'objectif : réduire le gaspillage, optimiser les ressources, et minimiser l'empreinte carbone.

2. Parcours utilisateur
L'application propose une interface simple et intuitive pour l'utilisateur :

En tant que visiteur :
Lorsqu'une personne non connectée arrive sur le site, elle peut visualiser uniquement les indicateurs clés des entreprises.

En tant qu'administrateur :

1.Tableau de Bord : Lorsqu'un utilisateur se connecte, il accède à un tableau de bord affichant un résumé des indicateurs clés (taux de gaspillage global, émissions de CO₂, suivi des consommations).

2.Gestion des Matières Premières : L'utilisateur peut ajouter ou modifier les informations sur les matières premières (nom, coût).

3.Suivi des Productions : Pour chaque production (ex. recette cuisinée pour un restaurant), l'utilisateur peut enregistrer les quantités utilisées, produites, et rejetées. L'application calcule automatiquement le gaspillage et les émissions de CO₂ associées.

4.Rapport Détaillé : L'utilisateur peut consulter des rapports détaillés pour analyser les sources principales de gaspillage ou d'émissions et identifier les axes d'amélioration.

3. Concrètement et techniquement
3.1. Base de données
La base de données sera construite ainsi :
- Utilisateur : id, nom, email, role (admin ou visiteur).
- Entreprise (1 utilisateur = 1 entreprise) : id, nom, description
- Matières Premières : id, nom, coût.
- Productions : id, date, quantité_produite, quantité_déchet, matières_utilisées.
- Déchets : id, type, quantité, émission_CO2. - Indicateurs Clés : Calculs des indicateurs pour chaque production.

3.2. Front
Le front sera développé avec HTML, CSS et un peu de JavaScript pour l'interactivité (par exemple, les graphiques dynamiques pour le tableau de bord). Nous utiliserons Bootstrap pour une mise en page rapide et responsive (ou autre selon le groupe de travail).

Les composants clés incluent :
- Une page d'accueil avec le tableau de bord.
- Des formulaires pour gérer les matières premières et enregistrer les productions.
- Une page de rapports interactifs avec graphiques.

3.3. Backend
Le backend sera développé avec Ruby on Rails, qui fournira une architecture MVC pour structurer proprement le projet. Nous créerons :
- La gestion des matières premières (CRUD).
- Le suivi des productions (ajout, édition).
- Le calcul des indicateurs environnementaux.

3.4. Mes besoins techniques
Mes compétences incluent :
- Une maîtrise de Ruby on Rails.
- Une bonne base en HTML, CSS.
- Conception de bases de données relationnelles.
- Maîtrise des indicateurs environnementaux

Compétences complémentaires nécessaires :
- Un designer (front) pour rendre l'application plus intuitive (avec Boostrap ou HTML/CSS ou autre).
- Expertise dans les graphiques dynamiques ou des bibliothèques.
- Un autre développeur backend pour collaborer sur le code Ruby on Rails

4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine
Pour le MVP, voici ce qui peut être présenté :
1. Une base fonctionnelle pour ajouter et gérer les matières premières (CRUD).
2. La possibilité d'enregistrer une production (exemple une recette) avec les quantités utilisées, produites, et gaspillées.
3. Un calcul simple du taux de gaspillage (entrée - sortie = perte) et des émissions de CO₂ (calcul simple) à partir des données saisies.
4. Un tableau de bord minimal affichant les indicateurs clés de manière statique.

5. La version que l'on présentera aux jury
Pour la version finale que nous montrerons au jury, l’objectif est d’avoir une application simple mais fonctionnelle, tout en mettant en avant son potentiel. Voici ce qui est proposé :

Un tableau de bord simple et clair :

Affiche les indicateurs principaux :
taux de gaspillage global et émissions de CO₂ totales.
Permet de visualiser rapidement les progrès réalisés grâce à l’application.
Un suivi de production basique :

L’utilisateur peut enregistrer les matières premières utilisées et les déchets générés pour une production spécifique.
Les calculs de gaspillage et des émissions de CO₂ associés sont affichés automatiquement.
Gestion des matières premières :

Ajouter et modifier les matières premières, avec des informations clés comme le coût et les émissions de CO₂ unitaires.
Rapports simplifiés :

Une vue détaillée par production qui montre les matières utilisées, les déchets générés, et les émissions associées. Par exemple : "Pour la recette A, vous avez utilisé 10 kg de légumes, produit 1 kg de déchets (épluchures), soit 2 kg d'émissions CO₂."

6. Notre mentor :
Amélie Loulergue, ancienne de THP (session 2021) et actuellement architecte front web