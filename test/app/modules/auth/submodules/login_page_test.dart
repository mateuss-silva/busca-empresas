import 'package:empresas_flutter/app/modules/auth/submodules/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LoginPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
