class Ejercicio5Logica {
  int cantidad = 0;
  List<int> serie = [];
  String resultadoTexto = '';

  void generar(int n) {
    cantidad = n;
    serie = [];

    if (n >= 1) {
      serie.add(0);
    }
    if (n >= 2) {
      serie.add(1);
    }

    for (int i = 2; i < n; i++) {
      int siguiente = serie[i - 1] + serie[i - 2];
      serie.add(siguiente);
    }

    resultadoTexto = 'Se generaron los primeros $n términos de Fibonacci.';
  }

  void reiniciar() {
    cantidad = 0;
    serie = [];
    resultadoTexto = '';
  }
}
