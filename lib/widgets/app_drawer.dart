import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Cabecera del menú con degradado
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.azulOscuro, AppColors.azulPrimario],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.menu_book,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'РОССИЯ ГАЙД',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tu guía para vivir en Rusia',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'v1.0.0',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Opciones del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  icon: Icons.home,
                  label: 'Inicio',
                  onTap: () {
                    Navigator.pop(context);
                    // Aquí luego navegaremos a Home
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.menu_book,
                  label: 'Capítulos',
                  onTap: () {
                    Navigator.pop(context);
                    // Cambiar a pestaña Capítulos (luego implementaremos)
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.note,
                  label: 'Mis Apuntes',
                  onTap: () {
                    Navigator.pop(context);
                    // Cambiar a pestaña Apuntes
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.bookmark,
                  label: 'Marcadores',
                  onTap: () {
                    Navigator.pop(context);
                    // Navegar a pantalla de marcadores
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.search,
                  label: 'Búsqueda',
                  onTap: () {
                    Navigator.pop(context);
                    // Activar búsqueda
                  },
                ),
                const Divider(),
                _buildDrawerItem(
                  icon: Icons.settings,
                  label: 'Configuración',
                  onTap: () {
                    Navigator.pop(context);
                    // Navegar a configuración
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.dark_mode,
                  label: 'Modo Oscuro',
                  trailing: Switch(
                    value: false, // Luego conectaremos con tema
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.language,
                  label: 'Idioma',
                  trailing: const Text('Español'),
                  onTap: () {
                    Navigator.pop(context);
                    // Cambiar idioma
                  },
                ),
                const Divider(),
                _buildDrawerItem(
                  icon: Icons.info,
                  label: 'Acerca de',
                  onTap: () {
                    Navigator.pop(context);
                    // Mostrar info
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.contact_mail,
                  label: 'Contacto / Soporte',
                  onTap: () {
                    Navigator.pop(context);
                    // Abrir email
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.star,
                  label: 'Calificar la app',
                  onTap: () {
                    Navigator.pop(context);
                    // Ir a store
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.azulPrimario),
      title: Text(label),
      trailing: trailing,
      onTap: onTap,
    );
  }
}