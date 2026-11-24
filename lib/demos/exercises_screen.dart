import 'package:flutter/material.dart';

/// Partie A : exercices guidés 3.1 à 3.6 regroupés sur un seul écran.
class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  // Exercice 3.6 (4) : on alterne l'emplacement du FAB.
  bool _centered = false;

  @override
  Widget build(BuildContext context) {
    // Exercice 3.6 : Scaffold + AppBar + actions + FAB + SnackBar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma page'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      floatingActionButtonLocation: _centered
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Bouton pressé')));
          setState(() => _centered = !_centered);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: const [
          _Title('3.1 Text et TextStyle'),
          _Ex31(),
          _Title('3.2 Image'),
          _Ex32(),
          _Title('3.3 Container, Padding, Center'),
          _Ex33(),
          _Title('3.4 Column, Row, Expanded'),
          _Ex34(),
          _Title('3.5 Stack (badge)'),
          _Ex35(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      );
}

// ---------------------------------------------------------------- 3.1
class _Ex31 extends StatelessWidget {
  const _Ex31();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Bonjour LocalSwap',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 250,
          color: Colors.grey.shade200,
          child: const Text(
            'Texte centré dans un Container de largeur fixe',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 3.2
class _Ex32 extends StatelessWidget {
  const _Ex32();

  @override
  Widget build(BuildContext context) {
    Widget fitBox(BoxFit fit, String label) => Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey.shade300,
              child: Image.network(
                'https://picsum.photos/300/200',
                fit: fit,
                // Gestion du réseau indisponible
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.wifi_off)),
              ),
            ),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        );

    return Column(
      children: [
        // Image locale (déclarée dans pubspec.yaml), avec repli.
        Image.asset(
          'assets/images/logo.png',
          height: 60,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.image_not_supported, size: 40),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            fitBox(BoxFit.cover, 'cover'),
            fitBox(BoxFit.contain, 'contain'),
            fitBox(BoxFit.fill, 'fill'),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 3.3
class _Ex33 extends StatelessWidget {
  const _Ex33();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          color: Colors.amber.shade100,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Padding.all(16)'),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.amber.shade100,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text('Padding.symmetric(24, 8)'),
          ),
        ),
        const SizedBox(height: 12),
        // Mini carte : Center > Padding > Container > Text
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Mini carte de test'),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 3.4
class _Ex34 extends StatelessWidget {
  const _Ex34();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Column : titre, sous-titre, description
        Container(
          height: 140,
          color: Colors.grey.shade200,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Titre',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Sous-titre'),
              Text('Description'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Row : icône + texte alignés
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.place),
            SizedBox(width: 8),
            Text('Tunis'),
          ],
        ),
        const SizedBox(height: 12),
        // Expanded avec flex
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.red.shade300)),
              Expanded(flex: 2, child: Container(color: Colors.green.shade300)),
              Container(width: 40, color: Colors.blue.shade300),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Mise en page mixte : en-tête + Expanded
        Container(
          height: 160,
          color: Colors.grey.shade100,
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.home),
                  ),
                  Text('En-tête', style: TextStyle(fontSize: 18)),
                ],
              ),
              Expanded(child: Container(color: Colors.orange.shade200)),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 3.5
class _Ex35 extends StatelessWidget {
  const _Ex35();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 64,
        height: 64,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.notifications, size: 56),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
