import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:repositoryviewer/main.dart' as app;
import 'package:repositoryviewer/widgets/proceedabletile.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('sample test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // テストコードをここに追加
    expect(find.text("List"), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    final textField = find.byType(TextField);
    await tester.showKeyboard(textField);
    await tester.pumpAndSettle();
    await tester.enterText(textField, 'Matool');
    await tester.pumpAndSettle();
    final testInput = TestTextInput();
    await testInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final tiles = find.byType(ProceedableTile);
    print(tiles);
    await tester.tap(tiles.at(0));
    await tester.pumpAndSettle();

    expect(find.text("Language"), findsOneWidget);
    expect(find.text("Stars"), findsOneWidget);
    expect(find.text("Watchers"), findsOneWidget);
    expect(find.text("Forks"), findsOneWidget);
    expect(find.text("Issues"), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
