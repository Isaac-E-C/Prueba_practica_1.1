import 'package:flutter/material.dart';
import '../logica/ejercicio5_logica.dart';

class Ejercicio5Pantalla extends StatefulWidget {
  const Ejercicio5Pantalla({super.key});

  @override
  State<Ejercicio5Pantalla> createState() => _Ejercicio5PantallaState();
}

class _Ejercicio5PantallaState extends State<Ejercicio5Pantalla> {
  Ejercicio5Logica logica = Ejercicio5Logica();
  TextEditingController valorController = TextEditingController();
  String mensajeError = '';

  void procesar() {
    final int? valor = int.tryParse(valorController.text);
    if (valor == null || valor <= 0) {
      setState(() {
        mensajeError = 'Ingrese la cantidad N de términos (entero positivo).';
      });
      return;
    }

    setState(() {
      mensajeError = '';
      logica.generar(valor);
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
        title: const Text('Ejercicio 5: Serie de Fibonacci'),
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
                      'Generar Serie de Fibonacci',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ingresa la cantidad N para obtener los primeros N términos de la secuencia.',
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
                labelText: 'Ingrese cantidad de términos (N)',
                hintText: 'Ejemplo: 10',
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
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Generar'),
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
            if (logica.serie.isNotEmpty) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        logica.resultadoTexto,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Secuencia: ${logica.serie.join(", ")}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Divider(),
                      const Text(
                        'Términos generados:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: logica.serie.length,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            title: Text('Término ${index + 1}'),
                            trailing: Text(
                              '${logica.serie[index]}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
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
