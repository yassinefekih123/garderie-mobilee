import 'package:flutter/material.dart';

const List<Map<String, dynamic>> activites = [
  {"id": 1, "titre": "Dessin et coloriage", "description": "Développement de la créativité", "icone": "🎨"},
  {"id": 2, "titre": "Jeux éducatifs", "description": "Apprentissage par le jeu", "icone": "🧩"},
  {"id": 3, "titre": "Musique et chansons", "description": "Éveil musical des enfants", "icone": "🎵"},
  {"id": 4, "titre": "Lecture de contes", "description": "Découverte des histoires", "icone": "📚"},
  {"id": 5, "titre": "Activités sportives", "description": "Développement de la motricité", "icone": "⚽"},
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectMenu(int index, String label) {
    setState(() => _selectedIndex = index);
    Navigator.pop(context); // ferme le Drawer
    _showMessage('Menu : $label');
  }

  Widget _buildBody() {
    if (_selectedIndex == 2) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Ma Garderie : application mobile de gestion des activités des enfants.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: activites.length,
      itemBuilder: (context, index) {
        final a = activites[index];
        return Card(
          child: ListTile(
            leading: Text(a['icone'], style: const TextStyle(fontSize: 32)),
            title: Text(a['titre']),
            subtitle: Text(a['description']),
            onTap: () => _showMessage(a['titre']),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text('Ma Garderie',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              selected: _selectedIndex == 0,
              onTap: () => _selectMenu(0, 'Accueil'),
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Activités'),
              selected: _selectedIndex == 1,
              onTap: () => _selectMenu(1, 'Activités'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              selected: _selectedIndex == 2,
              onTap: () => _selectMenu(2, 'À propos'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessage('Nouvelle activité'),
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
    );
  }
}