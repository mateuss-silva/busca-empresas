import 'package:empresas_flutter/app/shared/widgets/overlay_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('OverlayWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const OverlayWidget());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}