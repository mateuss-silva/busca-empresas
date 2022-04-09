import 'package:empresas_flutter/app/modules/home/widgets/top_gradient_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('TopGradientWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const TopGradientWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
