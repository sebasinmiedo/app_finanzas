class Transaccion {
  final String id; // Identificador único
  final String tipo; // 'Ingreso' o 'Retiro'
  final double cantidad; // Monto de la transacción
  final DateTime fecha; // Fecha de la transacción

  Transaccion({
    required this.id,
    required this.tipo,
    required this.cantidad,
    required this.fecha,
  });
}
