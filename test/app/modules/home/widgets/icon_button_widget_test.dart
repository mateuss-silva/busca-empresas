import 'package:flutter_test/flutter_test.dart';

main() {
  group('IconButtonWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(IconButtonWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
