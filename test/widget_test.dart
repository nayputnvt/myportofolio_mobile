import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio home page smoke test', (WidgetTester tester) async {
    // bangun widget myapp
    await tester.pumpWidget(const MyApp());

    // verifikasi bahwa judul myportfolio dan info profil tampil
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('NPM'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Class'), findsOneWidget);
  });
}
