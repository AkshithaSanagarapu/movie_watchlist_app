import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watchlist_app/main.dart';

void main() {
  testWidgets('Movie Watchlist app loads successfully', (tester) async {
    await tester.pumpWidget(const MovieWatchlistApp());

    expect(find.text('My Movie Watchlist'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('Interstellar'), findsOneWidget);
  });
}
