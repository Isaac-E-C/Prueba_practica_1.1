import 'package:flutter/material.dart';
import '../logica/ejercicio6_logica.dart';

class Ejercicio6Pantalla extends StatefulWidget {
  const Ejercicio6Pantalla({super.key});

  @override
  State<Ejercicio6Pantalla> createState() => _Ejercicio6PantallaState();
}

class _Ejercicio6PantallaState extends State<Ejercicio6Pantalla> {
  Ejercicio6Logica logica = Ejercicio6Logica();
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
        title: const Text('Ejercicio 6: Número Armstrong'),
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
                      'Determinar si un Número es Armstrong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Un número es Armstrong si la suma de sus dígitos elevados al número de cifras es igual al número original.',
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
                hintText: 'Ejemplo: 153 o 371',
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
                    icon: const Icon(Icons.calculate),
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
                color: logica.esArmstrong ? Colors.green.shade50 : Colors.orange.shade50,
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
                          color: logica.esArmstrong ? Colors.green.shade900 : Colors.orange.shade900,
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Número ingresado: ${logica.numero}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cantidad de cifras (N): ${logica.cantidadCifras}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cálculo: ${logica.digitos.map((d) => "$d^${logica.cantidadCifras}").join(" + ")} = ${logica.sumaPotencias}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Suma de potencias: ${logica.sumaPotencias}',
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
