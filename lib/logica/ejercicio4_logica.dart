class Ejercicio4Logica {
  int numero = 0;
  bool esPerfecto = false;
  int sumaDivisores = 0;
  List<int> divisores = [];
  String resultadoTexto = '';

  void calcular(int valor) {
    numero = valor;
    divisores = [];
    sumaDivisores = 0;

    for (int i = 1; i < valor; i++) {
      if (valor % i == 0) {
        divisores.add(i);
        sumaDivisores += i;
      }
    }

    esPerfecto = (sumaDivisores == valor);

    if (esPerfecto) {
      resultadoTexto = 'El número $valor ES un número perfecto.';
    } else {
      resultadoTexto = 'El número $valor NO es un número perfecto.';
    }
  }

  void reiniciar() {
    numero = 0;
    esPerfecto = false;
    sumaDivisores = 0;
    divisores = [];
    resultadoTexto = '';
  }
}
