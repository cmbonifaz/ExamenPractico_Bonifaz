import 'package:flutter/material.dart';

import '../model/empleado_model.dart';

class EmpleadoViewModel extends ChangeNotifier {
  String nivelDesempeno = 'Alto';

  void seleccionarDesempeno(String nivel) {
    nivelDesempeno = nivel;
    notifyListeners();
  }

  EmpleadoModelo calcular(double sueldo, int antiguedad) {
    double porcentaje = 0.0;

    if (antiguedad >= 10 && nivelDesempeno == 'Alto') {
      porcentaje = 0.20;
    } else if (antiguedad >= 5) {
      porcentaje = 0.10;
    } else {
      porcentaje = 0.05;
    }

    double bono = sueldo * porcentaje;
    double sueldoFinal = sueldo + bono;

    return EmpleadoModelo(
      sueldo: sueldo,
      antiguedad: antiguedad,
      desempeno: nivelDesempeno,
      porcentaje: porcentaje,
      bono: bono,
      sueldoFinal: sueldoFinal,
    );
  }
}

