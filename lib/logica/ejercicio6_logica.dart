class Ejercicio6Logica {
  int numero = 0;
  bool esArmstrong = false;
  int sumaPotencias = 0;
  int cantidadCifras = 0;
  List<int> digitos = [];
  String resultadoTexto = '';

  void calcular(int valor) {
    numero = valor;
    digitos = [];
    sumaPotencias = 0;

    String textoNumero = valor.toString();
    cantidadCifras = textoNumero.length;

    for (int i = 0; i < cantidadCifras; i++) {
      int digito = int.parse(textoNumero[i]);
      digitos.add(digito);

      int potencia = 1;
      for (int j = 0; j < cantidadCifras; j++) {
        potencia *= digito;
      }
      sumaPotencias += potencia;
    }

    esArmstrong = (sumaPotencias == valor);

    if (esArmstrong) {
      resultadoTexto = 'El número $valor ES un número Armstrong.';
    } else {
      resultadoTexto = 'El número $valor NO es un número Armstrong.';
    }
  }

  void reiniciar() {
    numero = 0;
    esArmstrong = false;
    sumaPotencias = 0;
    cantidadCifras = 0;
    digitos = [];
    resultadoTexto = '';
  }
}
