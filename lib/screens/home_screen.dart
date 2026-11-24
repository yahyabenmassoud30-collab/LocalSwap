import 'package:flutter/material.dart';

import '../demos/exercises_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/listing_card.dart';

/// Écran d'accueil LocalSwap (Partie B, questions 1 et 2).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalSwap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Exercices TP3',
            icon: const Icon(Icons.science_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ExercisesScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // En-tête : logo + slogan
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Logo : Image.asset avec repli si le fichier n'existe pas.
                Image.asset(
                  'assets/images/logo.png',
                  width: 56,
                  height: 56,
                  errorBuilder: (_, __, ___) => const CircleAvatar(
                    radius: 28,
                    backgroundColor: AppTheme.primary,
                    child: Icon(Icons.swap_horiz, color: Colors.white, size: 32),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LocalSwap',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Text('Échangez près de chez vous, simplement.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Zone réservée à la future liste d'annonces (TP4)
          Expanded(
            child: ListView(
              children: const [
                ListingCard(),
                ListingCard(
                  title: 'Livres de cuisine',
                  description: 'Lot de 5 livres, recettes tunisiennes.',
                  location: 'Tunis, Lac 2',
                  category: 'Livres',
                  icon: Icons.menu_book,
                ),
                ListingCard(
                  title: 'Casque audio',
                  description: 'Bluetooth, batterie neuve.',
                  location: 'Ariana',
                  category: 'High-tech',
                  icon: Icons.headphones,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Publier une annonce (bientôt)')),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
