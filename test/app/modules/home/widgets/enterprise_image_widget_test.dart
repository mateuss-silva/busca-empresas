import 'package:flutter_test/flutter_test.dart';

main() {
  group('EnterpriseImageWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(EnterpriseImageWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
