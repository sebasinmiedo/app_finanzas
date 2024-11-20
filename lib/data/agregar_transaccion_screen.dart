// lib/data/agregar_transaccion_screen.dart

import 'package:flutter/material.dart';
import '../models/transaccion.dart'; // Asegúrate de importar el modelo de Transacción

class AgregarTransaccionScreen extends StatefulWidget {
  final Function(Transaccion) onAgregar; // Callback para agregar transacción

  const AgregarTransaccionScreen({super.key, required this.onAgregar});

  @override
  _AgregarTransaccionScreenState createState() =>
      _AgregarTransaccionScreenState();
}

class _AgregarTransaccionScreenState extends State<AgregarTransaccionScreen> {
  final _tipoController = TextEditingController();
  final _cantidadController = TextEditingController();
  DateTime _fechaSeleccionada = DateTime.now();

  void _guardarTransaccion() {
    final tipo = _tipoController.text;
    final cantidad = double.tryParse(_cantidadController.text) ?? 0;

    if (tipo.isNotEmpty && cantidad > 0) {
      final nuevaTransaccion = Transaccion(
        id: DateTime.now()
            .toString(), // Puedes usar un generador de ID más robusto
        tipo: tipo,
        cantidad: cantidad,
        fecha: _fechaSeleccionada,
      );
      widget.onAgregar(
          nuevaTransaccion); // Llama a la función para agregar transacción
      Navigator.of(context).pop(); // Cierra la pantalla
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Transacción'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tipoController,
              decoration:
                  const InputDecoration(labelText: 'Tipo (Ingreso/Retiros)'),
            ),
            TextField(
              controller: _cantidadController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _guardarTransaccion,
              child: const Text('Guardar Transacción'),
            ),
          ],
        ),
      ),
    );
  }
}
