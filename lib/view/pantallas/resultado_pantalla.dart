import 'package:flutter/material.dart';

import '../../model/empleado_model.dart';

class ResultadoPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empleado =
        ModalRoute.of(context)!.settings.arguments as EmpleadoModelo;

    Widget dato(String titulo, String valor, {bool destacado = false}) {
      return ListTile(
        title: Text(
          titulo,
          style: TextStyle(
            fontWeight: destacado ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: Text(
          valor,
          style: TextStyle(
            fontSize: destacado ? 18 : 16,
            fontWeight: destacado ? FontWeight.bold : FontWeight.normal,
            color: destacado ? Colors.blue[800] : Colors.black87,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado del Bono'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  dato(
                    'Sueldo Base',
                    '\$${empleado.sueldo.toStringAsFixed(2)}',
                  ),
                  Divider(height: 1),
                  dato('Antigüedad', '${empleado.antiguedad} años'),
                  Divider(height: 1),
                  dato('Nivel de Desempeño', empleado.desempeno),
                  Divider(height: 1),
                  dato(
                    'Porcentaje de Bono',
                    '${(empleado.porcentaje * 100).toStringAsFixed(0)} %',
                  ),
                  Divider(height: 1),
                  dato(
                    'Monto del Bono',
                    '\$${empleado.bono.toStringAsFixed(2)}',
                  ),
                  Divider(height: 1),
                  dato(
                    'Sueldo Final',
                    '\$${empleado.sueldoFinal.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Regresar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
