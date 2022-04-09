import 'package:empresas_flutter/app/modules/home/widgets/enterprise_card_widget.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('EnterpriseCardWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(EnterpriseCardWidget(enterprise: EnterpriseModel(id: 1, name: "empresa 1")));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}