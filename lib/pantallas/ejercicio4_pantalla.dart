import 'package:flutter/material.dart';
import '../logica/ejercicio4_logica.dart';

class Ejercicio4Pantalla extends StatefulWidget {
  const Ejercicio4Pantalla({super.key});

  @override
  State<Ejercicio4Pantalla> createState() => _Ejercicio4PantallaState();
}

class _Ejercicio4PantallaState extends State<Ejercicio4Pantalla> {
  Ejercicio4Logica logica = Ejercicio4Logica();
  TextEditingController valorController = TextEditingController();
  String mensajeError = '';

  void procesar() {
    final int? valor = int.tryParse(valorController.text);
    if (valor == null || valor <= 0) {
      setState(() {
        mensajeError = 'Ingrese un número entero positivo válido.';
      });
      return;
    }

    setState(() {
      mensajeError = '';
      logica.calcular(valor);
    });
  }

  void reiniciar() {
    setState(() {
      logica.reiniciar();
      valorController.clear();
      mensajeError = '';
    });
  }

  @override
  void dispose() {
    valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4: Números Perfectos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Determinar si un Número es Perfecto',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Un número es perfecto cuando la suma de sus divisores propios es igual al mismo número.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese un número entero positivo',
                hintText: 'Ejemplo: 28',
                border: OutlineInputBorder(),
              ),
            ),
            if (mensajeError.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                mensajeError,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: procesar,
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Verificar'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: reiniciar,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Limpiar'),
                ),
              ],
            ),
            if (logica.resultadoTexto.isNotEmpty) ...[
              const SizedBox(height: 16),
              Card(
                color: logica.esPerfecto ? Colors.green.shade50 : Colors.orange.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        logica.resultadoTexto,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: logica.esPerfecto ? Colors.green.shade900 : Colors.orange.shade900,
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Número ingresado: ${logica.numero}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Divisores propios: ${logica.divisores.join(", ")}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Suma de divisores: ${logica.sumaDivisores}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
