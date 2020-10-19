# Projet trombinoscope (Groupe-5)
Trombinoscope est un projet académique qui consiste à traiter des données volumineuses à partir d'un fichier csv.
# Sécurité
* Pour protéger et limiter l'accès au projet, il est nécessaire de passer par un système d'authentification qui utilise JWT(Json Web Token). 
* Un fichier .htaccess est mis en place pour empêcher les utilisateurs de récupérer/éditer le fichier source contenant les données (fichier csv)
# Interface graphique
Cette interface permet aux utilisateurs de:
* Visualiser les données dans le fichier source de manière simple et claire avec un système de pagination (Bootstrap)
* Voir et comparer les statistiques des gens grâce à des graphs (Javascript  et D3.js)
* Un système de filtrage de données est mis en place pour optimiser la visualisation.
