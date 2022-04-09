import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/semi_circle_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LoginSemiCircleWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(SemiCircleWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
