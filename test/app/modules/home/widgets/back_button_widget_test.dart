import 'package:empresas_flutter/app/modules/home/widgets/back_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('BackButtonWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const BackButtonWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
