import 'package:flutter/material.dart';

const List<Map<String, dynamic>> activites = [
  {"id": 1, "titre": "Dessin et coloriage", "description": "Développement de la créativité", "icone": "🎨"},
  {"id": 2, "titre": "Jeux éducatifs", "description": "Apprentissage par le jeu", "icone": "🧩"},
  {"id": 3, "titre": "Musique et chansons", "description": "Éveil musical des enfants", "icone": "🎵"},
  {"id": 4, "titre": "Lecture de contes", "description": "Découverte des histoires", "icone": "📚"},
  {"id": 5, "titre": "Activités sportives", "description": "Développement de la motricité", "icone": "⚽"},
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text('Ma Garderie',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Accueil')),
            ListTile(leading: Icon(Icons.palette), title: Text('Activités')),
            ListTile(leading: Icon(Icons.info), title: Text('À propos')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: activites.length,
        itemBuilder: (context, index) {
          final a = activites[index];
          return Card(
            child: ListTile(
              leading: Text(a['icone'], style: const TextStyle(fontSize: 32)),
              title: Text(a['titre']),
              subtitle: Text(a['description']),
            ),
          );
        },
      ),
    );
  }
}