import 'package:empresas_flutter/app/modules/home/pages/enterprise_description_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('CompanyDescriptionPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const EnterpriseDescriptionPage(title: 'T'));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
