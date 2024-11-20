// lib/data/principal_screen.dart

import 'package:flutter/material.dart';
import 'agregar_transaccion_screen.dart'; // Asegúrate de importar la pantalla de agregar transacciones
import '../models/transaccion.dart'; // Importa el modelo de Transacción

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  final List<Transaccion> _transacciones =
      []; // Lista para almacenar las transacciones

  void _agregarTransaccion(Transaccion transaccion) {
    setState(() {
      _transacciones.add(transaccion);
    });
  }

  void _navegarAgregarTransaccion() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AgregarTransaccionScreen(
          onAgregar:
              _agregarTransaccion, // Pasamos la función para agregar transacciones
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transacciones'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _transacciones.length,
              itemBuilder: (context, index) {
                final transaccion = _transacciones[index];
                return ListTile(
                  title: Text('${transaccion.tipo}: \$${transaccion.cantidad}'),
                  subtitle: Text(transaccion.fecha.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _navegarAgregarTransaccion,
              child: const Text('Agregar Transacción'),
            ),
          ),
          Container(
            child: Image.network(
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.syncfusion.com%2Fflutter-widgets%2Fflutter-charts&psig=AOvVaw3Uv_KwAUo_wLaqeuSZKkDo&ust=1732206376894000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKiC_tWq64kDFQAAAAAdAAAAABAE"),
          )
        ],
      ),
    );
  }
}
