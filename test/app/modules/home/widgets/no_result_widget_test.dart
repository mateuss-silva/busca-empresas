import 'package:empresas_flutter/app/modules/home/widgets/no_result_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('NoResultWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const NoResultWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}