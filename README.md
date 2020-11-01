# # Projet trombinoscope (Groupe-5)

Trombinoscope est un projet académique pour le cours Langages et Technologies Web (Master 2 informatique parcours THYP 2020-2021). Il consiste à traiter des données volumineuses à partir d'un fichier csv.

# Présentation
Un trombinoscope est une liste des photographies des membres d'une organisation, d'un groupe, d'une classe (à l'école). C'est un outil qui sert principalement à faire connaitre les membres d'une organisation.

# Contexte du projet
En cette période de crise sanitaire, le travail à distance est privilégié. Dans ce contexte, il est compliqué de faire connaissance avec ses collègues. Ce problème est accentué lorsqu'un nouveau salarié intègre une entreprise.

# Intentions et objectifs
L'idée est que tout nouveau membre de l'organisation puisse avoir accès à une plateforme interne à l'entreprise ou les profils des membres sont disponibles. Cela permet aux employés de se connaitre afin de faciliter l'intégration des nouveaux membres. Il s'agit d'un trombinoscope en ligne où sont enregistrés tous les profils avec photos des membres de l'organisation. Ainsi, un nouveau salarié peut facilement mettre un visage sur un collègue avec qui il a échangé. Il peut aussi avoir accès à certaines informations personnelles mis en ligne par ses collègues afin de trouver des points en commun avec eux et de tisser des liens plus facilement.

# Sécurité
Pour protéger et limiter l'accès au projet, il est nécessaire de passer par un système d'authentification qui utilise JWT (Json Web Token).

# Interface graphique
Cette interface permet aux utilisateurs de :
Visualiser les données dans le fichier source de manière simple et claire avec un système de pagination (Bootstrap)
Voir et comparer les statistiques des gens grâce à des graphs (Javascript et D3.js)
Un système de filtrage de données est mis en place pour optimiser la visualisation.

# Issues proposées
Chaque employé pourra faire une gestion CRUD de son profil. Il y aura aussi un profil administrateur (ADMIN) qui servira à administrer l'ensemble du site. L’Administrateur pourra faire une gestion CRUD de l’ensemble des comptes de l’application. Les animateurs (ANIMATEUR) quant à eux pourront aussi jouer le rôle de modérateur et s'assurer qu'aucune dérive ne soit tolérée. Un modérateur peut activer ou désactiver un compte. A la création, un compte est désactivé par défaut. Dès la création d’un nouveau compte, un mail est envoyé à tous les modérateurs pour leur indiquer qu’un nouveau compte vient d’être créé et qu’il faudrait l’activer. Dès qu’un changement s’opère sur un compte, une notification par mail est envoyée aux modérateurs.
Un compte qui n’est ni ADMINISTRATEUR, ni ANIMATEUR est un profil SIMPLE. Par défaut, tout nouveau type compte est de type SIMPLE. Pour passer du type simple à animateur, il faut l’aval de l’administrateur. L’administrateur peut aussi promouvoir un animateur au grade d’administrateur.

# Technologies choisies
Les technologies utilisées pour ce projet sont les suivantes : 
* Framework Spring Boot
* Langages Java, HTML/CSS/JS
* JWT
* .htaccess
* Base de données MySQL
# les éléments de vocabulaires du projet sont disponibles dans google spreadsheet : 
https://docs.google.com/spreadsheets/d/1-YaoHuiGpOe7FyAZH6zWCG0dkdQCiBZZIxP7X690GaA/edit?usp=sharing
