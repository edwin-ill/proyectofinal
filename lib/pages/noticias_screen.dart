import 'package:flutter/material.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';

class NoticiasScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text(
          'Noticias Específicas',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
