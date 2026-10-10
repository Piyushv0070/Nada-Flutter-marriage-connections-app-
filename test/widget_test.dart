import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nada_app/main.dart';
import 'package:nada_app/models/profile.dart';
import 'package:nada_app/providers/profile_provider.dart';

void main() {
  testWidgets('Search filter correctly filters profile list or shows empty state',
          (WidgetTester tester) async {
        // Mock profiles dataset based on supplied JSON
        final mockProfiles = [
          Profile(
            id: 1,
            name: 'Ananya Sharma',
            city: 'Noida',
            connectedThrough: 'Your cousin Nikhil knows her brother.',
          ),
          Profile(
            id: 2,
            name: 'Rohan Agarwal',
            city: 'Delhi',
            connectedThrough: 'Your uncle Rajesh knows his father from the Lajpat Nagar traders\' association.',
          ),
        ];

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              profilesFutureProvider.overrideWith((ref) async => mockProfiles),
            ],
            child: const MaterialApp(home: NadaApp()),
          ),
        );

        // Wait for async future provider to settle
        await tester.pumpAndSettle();

        // Verify initial state shows both profiles
        expect(find.text('Ananya Sharma'), findsOneWidget);
        expect(find.text('Rohan Agarwal'), findsOneWidget);

        // Enter search query that matches only Ananya
        await tester.enterText(find.byType(TextField), 'Noida');
        await tester.pump();

        expect(find.text('Ananya Sharma'), findsOneWidget);
        expect(find.text('Rohan Agarwal'), findsNothing);

        // Enter query that matches nothing to verify empty state
        await tester.enterText(find.byType(TextField), 'NonexistentCity');
        await tester.pump();

        expect(find.text('No profiles match'), findsOneWidget);
      });
}