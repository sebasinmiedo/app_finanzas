import 'package:flutter/material.dart';
import 'database_helper.dart';

class ListaTransaccionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transacciones'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().obtenerTransacciones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final transacciones = snapshot.data!;
            return ListView.builder(
              itemCount: transacciones.length,
              itemBuilder: (context, index) {
                final transaccion = transacciones[index];
                return ListTile(
                  title: Text(
                      '${transaccion['tipo']} - ${transaccion['cantidad']}'),
                  subtitle: Text(transaccion['fecha']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
