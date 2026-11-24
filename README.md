# LocalSwap — TP3 : Widgets fondamentaux, layout et Material

Application Flutter réalisée pour le TP3.

## Contenu

| Fichier | Rôle |
|---|---|
| `lib/main.dart` | Point d'entrée, `MaterialApp` + thème global |
| `lib/theme/app_theme.dart` | `ThemeData` LocalSwap (Partie B.4) |
| `lib/screens/home_screen.dart` | Écran d'accueil `Scaffold` / `AppBar` / FAB (B.1, B.2) |
| `lib/widgets/listing_card.dart` | Gabarit statique de carte d'annonce (B.3) |
| `lib/demos/exercises_screen.dart` | Exercices guidés 3.1 à 3.6 (Partie A) |

Les exercices de la Partie A sont accessibles via l'icône 🧪 de l'`AppBar`.

## Lancer le projet

```bash
flutter create .      # génère les dossiers android/ios/web (une seule fois)
flutter pub get
flutter run
```

Optionnel : placer un `logo.png` dans `assets/images/` (sinon une icône de repli s'affiche).

## Réponse à la question 3.1

Un `Text` ne peut pas être modifié après création (`text.value = ...`) car les widgets Flutter
sont **immuables** : toutes leurs propriétés sont `final`. Un widget n'est qu'une description
légère de l'interface. Pour changer l'affichage, on reconstruit un nouveau widget avec de
nouvelles valeurs (via `setState` dans un `StatefulWidget`), et Flutter compare l'ancien et le
nouvel arbre pour ne mettre à jour que ce qui a changé. Cela rend la reconstruction peu coûteuse
et le comportement prévisible.

## Comparaisons (3.2)

- `Image.network` : nécessite le réseau ; sans connexion l'image échoue, d'où l'`errorBuilder`.
- `Image.asset` : embarquée dans l'app, toujours disponible, mais augmente sa taille.
- `BoxFit.cover` remplit la boîte en rognant ; `contain` montre toute l'image sans déformer
  (bandes vides possibles) ; `fill` remplit en déformant.
