import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/input_text_field_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('InputTextFieldWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const InputTextFieldWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}