import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('test add todo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('title')), 'title');
    await tester.enterText(find.byKey(const Key('description')), 'description');
    await tester.tap(find.text('Add Todo'));
    await tester.pumpAndSettle();
    expect(find.text('Title'), findsNothing);
    expect(find.text('Description'), findsNothing);
  });

  testWidgets('test add multiple todos', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('title')), 'Todo Title1');
    await tester.enterText(find.byKey(const Key('description')), 'Todo Desc1');
    await tester.tap(find.text('Add Todo'));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title1'), findsOneWidget);
    expect(find.text('Todo Desc1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('title')), 'Todo Title2');
    await tester.enterText(find.byKey(const Key('description')), 'Todo Desc2');
    await tester.tap(find.text('Add Todo'));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title2'), findsOneWidget);
    expect(find.text('Todo Desc2'), findsOneWidget);
  });

  testWidgets('test delete todo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('title')), 'Todo Title1');
    await tester.enterText(find.byKey(const Key('description')), 'Todo Desc1');
    await tester.tap(find.text('Add Todo'));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title1'), findsOneWidget);
    expect(find.text('Todo Desc1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title1'), findsNothing);
    expect(find.text('Todo Desc1'), findsNothing);
  });

  testWidgets('test done todo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('title')), 'Todo Title1');
    await tester.enterText(find.byKey(const Key('description')), 'Todo Desc1');
    await tester.tap(find.text('Add Todo'));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title1'), findsOneWidget);
    expect(find.text('Todo Desc1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.check_circle));
    await tester.pumpAndSettle();
    expect(find.text('Todo Title1'), findsOneWidget);
    expect(find.text('Todo Desc1'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsNothing);
  });

  testWidgets('test toggle new todo form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('New Todo'), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    expect(find.text('New Todo'), findsNothing);
  });
}
