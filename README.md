# Calcul de Masse Stélaire

Exploration du Framework Flutter avec la mise au point d'un project.

## Mise au point !!

Le Stellar Mass Calculator (SMC) est une application mobile développée avec le framework Flutter qui permet aux utilisateurs de calculer leur poids sur différentes planètes du système solaire et de calculer la masse gravitationnelle entre deux planètes en fonction de leur distance et de leur masse. Le développement de cette application à pour but de fournir une expérience basique et éducative pour les utilisateurs intéressés par l'astronomie et la physique.

### Fonctionnalités Principales

#### 1. Calcul du poids sur différentes planètes :
   
L'utilisateur peut saisir son poids en kilogrammes (kg) sur Terre, puis l'application utilise les données de gravité des planètes du système solaire pour calculer le poids de ce dernier sur chacune des planètes.
Les poids calculés sont affichés pour chaque planète avec des images correspondantes.

#### 2. Formule Utilisée 

La formule utilisée pour le calcul du poids sur une planète est la suivante : Poids_sur_la_planète = Poids_sur_Terre * Gravité_de_la_planète.

#### 3. Calcul de la Masse Gravitationnelle entre Deux Planètes :
   
L'utilisateur peut saisir la masse de deux planètes en kilogrammes (kg) et la distance entre elles en mètres (m), ensuite L'application calcule la force gravitationnelle entre les deux planètes.

#### Formule Utilisée 

La formule utilisée pour le calcul de la masse gravitationnelle entre deux planètes est la loi de la gravité universelle de Newton : F = (G * m1 * m2) / (d * d), où F représente la force gravitationnelle, G est la constante gravitationnelle, m1 et m2 sont les masses des planètes, et d est la distance entre elles.


#### 4. Widgets et Composants Utilisés 
   
L'application utilise une variété de widgets et composants de Flutter pour créer une interface utilisateur conviviale :

"Scaffold", "AppBar", et "Text" pour la barre de navigation et l'affichage des titres.
"Container" et "DecorationImage" pour l'arrière-plan de l'application.
"Column" pour organiser les éléments de l'interface utilisateur de manière verticale.
"Text", "TextField", "ElevatedButton", "Card", "ListTile", et "Image.asset" pour afficher les informations et les images des planètes.
"Navigation" avec "Navigator" pour permettre à l'utilisateur de passer entre les pages.

#### 5. Détails Techniques

Les données sur la gravité des planètes du système solaire sont stockées dans une classe "UserData" qui s'étend "ChangeNotifier" pour gérer les mises à jour des données en temps réel.
Le calcul du poids sur différentes planètes est effectué en multipliant le poids de l'utilisateur sur Terre par la gravité de chaque planète.
Le calcul de la masse gravitationnelle entre deux planètes est basé sur la loi de la gravité universelle de Newton, L'application utilise la constante gravitationnelle de Newton (6.67430e-11 m³ kg⁻¹ s⁻²) dans les calculs.

#### 6. Conception graphique 

L'application est conçue de manière conviviale avec une interface utilisateur simple et intuitive. Les images des planètes sont utilisées pour améliorer l'expérience visuelle de l'utilisateur.

#### 7. Publique ciblé 

Etant un grand pasionné de physique, La cible publique de l'application Stellar Mass Calculator (SMC) comprend les amateurs d'astronomie, les étudiants en sciences, et toute personne intéressée par l'astronomie, la physique et l'espace.

#### 8. Conclusion
L'application Stellar Mass Calculator (SMC) vise à offrir une expérience éducative et ludique pour les utilisateurs qui souhaitent explorer des concepts liés à l'astronomie, à la gravité et à la physique, Elle fournit des outils de calcul pratiques pour mieux comprendre ces concepts.





