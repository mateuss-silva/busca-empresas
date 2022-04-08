import 'package:empresas_flutter/app/modules/home/widgets/gradient_background_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('GradientBackgroundWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const GradientBackgroundWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
