import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/empleado_viewmodel.dart';
import '../widgets/campo_numero.dart';
import '../widgets/option_button.dart';

class EmpleadoPantalla extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmpleadoPantallaState();
}

class _EmpleadoPantallaState extends State<EmpleadoPantalla> {
  final sueldoController = TextEditingController();
  final antiguedadController = TextEditingController();

  void calcular() {
    if (sueldoController.text.isEmpty || antiguedadController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingrese todos los datos')),
      );
      return;
    }

    double sueldo = double.parse(sueldoController.text);
    int antiguedad = int.parse(antiguedadController.text);

    final vm = context.read<EmpleadoViewModel>();
    final resultado = vm.calcular(sueldo, antiguedad);

    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EmpleadoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Datos del Empleado'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CampoNumero(
                      etiqueta: 'Sueldo (\$)',
                      controller: sueldoController,
                      icono: Icons.attach_money,
                    ),
                    SizedBox(height: 15),
                    CampoNumero(
                      etiqueta: 'Años de Antigüedad',
                      controller: antiguedadController,
                      icono: Icons.calendar_today,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Nivel de Desempeño',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OptionButton(
                      text: 'Alto',
                      valor: 'Alto',
                      seleccionado: vm.nivelDesempeno,
                      onChange: (valor) => vm.seleccionarDesempeno(valor!),
                    ),
                    OptionButton(
                      text: 'Medio',
                      valor: 'Medio',
                      seleccionado: vm.nivelDesempeno,
                      onChange: (valor) => vm.seleccionarDesempeno(valor!),
                    ),
                    OptionButton(
                      text: 'Bajo',
                      valor: 'Bajo',
                      seleccionado: vm.nivelDesempeno,
                      onChange: (valor) => vm.seleccionarDesempeno(valor!),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: calcular,
              icon: Icon(Icons.calculate),
              label: Text('Calcular Bono'),
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

