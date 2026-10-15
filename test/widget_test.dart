import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_practica_1/main.dart';

void main() {
  testWidgets('Carga de la aplicación', (WidgetTester tester) async {
    await tester.pumpWidget(const MiAplicacion());
    expect(find.text('Aplicación Móvil - Prueba Práctica 1'), findsOneWidget);
  });
}
