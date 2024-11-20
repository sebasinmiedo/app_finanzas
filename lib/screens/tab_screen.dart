// lib/tab_screen.dart

import 'package:aplicacion_finanzas/data/agregar_transaccion_screen.dart';
import 'package:aplicacion_finanzas/data/lista_transacciones_screen.dart';
import 'package:aplicacion_finanzas/data/pricipal_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5, vsync: this); // Cambia a 5 para incluir las nuevas pestañas
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              _showHelpDialog(context);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'PRINCIPAL'),
            Tab(text: 'TRANSACCIONES'),
            Tab(text: 'CATEGORIAS'),
            Tab(text: 'HOJA DE BALANCE'),
            Tab(text: 'PRESUPUESTO'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: const Center(
                child: Text('Menu de Opciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                // Acción para la opción de Inicio
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                // Acción para la opción de Configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Acción para la opción de Cerrar sesión
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PrincipalScreen(), // Ahora usamos PrincipalScreen
          ListaTransaccionesScreen(),
          AgregarTransaccionScreen(
            onAgregar: (Transaccion) {},
          ),
          Center(child: Text('Calendar Screen')),
          Center(child: Text('Budget Screen')),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ayuda'),
          content: const Text('Aquí va la información de ayuda.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
