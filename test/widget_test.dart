import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:name_trail/main.dart';

const String apiKey = 'na368221867';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test("Test API", () async {
    final name = "Omar";

    final response = await http.get(
        'https://www.behindthename.com/api/lookup.json?name=$name&key=$apiKey');
    if(response.body == null || response.body.isEmpty) return null;
    final result = json.decode(response.body);

    // Verify that the result is not null
    expect(result, isNotNull);

    // Verify that the API is returning valid usages
    expect(result[0]['usages'][0]['usage_full'], "Arabic");
  });
}
