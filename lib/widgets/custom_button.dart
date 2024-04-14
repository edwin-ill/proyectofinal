import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color; // Nuevo parámetro para el color del botón
  final Color textColor; // Nuevo parámetro para el color del texto

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color, // Agregar el parámetro color
    required this.textColor, // Agregar el parámetro textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Usar el color proporcionado para el botón
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Usar el color proporcionado para el texto
        ),
      ),
    );
  }
}
