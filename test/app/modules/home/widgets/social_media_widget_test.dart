import 'package:flutter_test/flutter_test.dart';

main() {
  group('SocialMediaWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(SocialMediaWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
