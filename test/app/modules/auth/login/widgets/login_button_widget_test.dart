import 'package:empresas_flutter/app/modules/auth/login/widgets/login_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LoginButtonWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(LoginButtonWidget(onPressed: () {}));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
