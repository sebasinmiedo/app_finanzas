import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0.0,
        size.height *
            0.50); // Línea recta desde la esquina superior hasta el 20% de la altura.

    // Primer punto de control para bajar.
    var firstControlPoint = Offset(size.width * 0.25, size.height * 0.55);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.45);

    // Segundo punto de control para crear el regreso hacia arriba.
    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.35);
    var secondEndPoint = Offset(size.width, size.height * 0.50);

    // Dibujamos las curvas.
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // Línea hasta la parte superior derecha.
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(
        0.0,
        size.height *
            0.50); // Comienza en un 80% de la altura para iniciar la curva hacia arriba.

    // Primer punto de control para bajar.
    var firstControlPoint = Offset(size.width * 0.25, size.height * 0.55);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.45);

    // Segundo punto de control para crear el regreso hacia abajo.
    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.30);
    var secondEndPoint = Offset(size.width, size.height * 0.5);

    // Dibujamos las curvas.
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // Línea hasta la parte inferior derecha.
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
