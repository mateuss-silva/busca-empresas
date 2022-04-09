import 'package:flutter_test/flutter_test.dart';

main() {
  group('CompanyDescriptionPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(EnterpriseDescriptionPage());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
