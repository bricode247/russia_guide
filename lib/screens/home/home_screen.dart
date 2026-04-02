import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../widgets/general_widgets/app_drawer.dart'; // Importamos el drawer
import '../../data/general_data/chapters_repository.dart';
import '../../models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Datos temporales para mostrar la UI de apuntes
  final List<Note> mockNotes = [
    Note(
      id: 1,
      title: 'Nota de ejemplo',
      content: 'Contenido de prueba',
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    ),
    Note(
      id: 2,
      title: 'Segunda nota',
      content: 'Otro contenido',
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    ),
  ]; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El drawer VA AQUÍ, al mismo nivel que appBar, NO dentro de appBar
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Добро пожаловать в Россию'),
        backgroundColor: AppColors.azulPrimario,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Capítulos'),
            Tab(text: 'Apuntes'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Pestaña Capítulos (igual que antes)
          ListView.builder(
            itemCount: ChaptersRepository.getAll().length,
            itemBuilder: (context, index) {
              final chapter = ChaptersRepository.getAll()[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.azulClaro,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      chapter.number == 0 ? '📘' : '${chapter.number}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.azulOscuro,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  chapter.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(chapter.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ChaptersRepository.getScreenForChapter(chapter),
                    ),
                  );
                },
              );
            },
          ),
          // Pestaña Apuntes (igual que antes)
          ListView.builder(
            itemCount: mockNotes.length,
            itemBuilder: (context, index) {
              final note = mockNotes[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.amarillo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.note, color: Colors.white),
                ),
                title: Text(note.title),
                subtitle: Text(
                  'Última modificación: ${note.modifiedAt.day}/${note.modifiedAt.month}/${note.modifiedAt.year}',
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Editando: ${note.title}')),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          return _tabController.index == 1
              ? FloatingActionButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Crear nuevo apunte')),
                    );
                  },
                  child: const Icon(Icons.add),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}