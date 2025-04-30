import 'package:animated_rating_feedback/animated_rating_feedback.dart'; // Ensure this import is correct
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedFeedbackRating widget test', (
    WidgetTester tester,
  ) async {
    // Create a RatingController with the necessary data (same as in the main.dart file)
    final RatingController<String> controller = RatingController<String>(
      ratingOptions: [
        RatingOption(
          id: '1',
          label: 'Terrible',
          value: 'terrible',
          emoji: '😞',
          icon: Icons.sentiment_very_dissatisfied,
        ),
        RatingOption(
          id: '2',
          label: 'Bad',
          value: 'bad',
          emoji: '😟',
          icon: Icons.thumb_down,
        ),
        RatingOption(
          id: '3',
          label: 'Okay',
          value: 'okay',
          emoji: '😐',
          icon: Icons.sentiment_neutral,
        ),
        RatingOption(
          id: '4',
          label: 'Good',
          value: 'good',
          emoji: '😊',
          icon: Icons.thumb_up,
        ),
        RatingOption(
          id: '5',
          label: 'Excellent',
          value: 'excellent',
          emoji: '😍',
          icon: Icons.favorite,
        ),
      ],
      feedbackOptionsMap: {
        '1': [
          FeedbackItem(id: 'f1', text: "Not helpful"),
          FeedbackItem(id: 'f2', text: "Too slow"),
          FeedbackItem(id: 'f9', text: "Too complicated"),
        ],
        '2': [
          FeedbackItem(id: 'f3', text: "Missing info"),
          FeedbackItem(id: 'f4', text: "Needs improvement"),
          FeedbackItem(id: 'f10', text: "Not user-friendly"),
        ],
        '3': [
          FeedbackItem(id: 'f5', text: "Could be better"),
          FeedbackItem(id: 'f11', text: "Decent experience"),
          FeedbackItem(id: 'f12', text: "Average service"),
        ],
        '4': [
          FeedbackItem(id: 'f6', text: "Good support"),
          FeedbackItem(id: 'f13', text: "Helpful"),
        ],
        '5': [
          FeedbackItem(id: 'f7', text: "Very fast"),
          FeedbackItem(id: 'f8', text: "Perfect service"),
          FeedbackItem(id: 'f14', text: "Exceeded expectations"),
        ],
      },
    );

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: AnimatedFeedbackRating(controller: controller)),
        ),
      ),
    );

    // Verify that the 'Terrible' rating option is present
    expect(find.text('Terrible'), findsOneWidget);

    // Tap on the 'Terrible' rating option
    await tester.tap(find.text('Terrible'));
    await tester.pumpAndSettle(); // Wait for the widget to settle after the tap

    // Verify that the feedback options for 'Terrible' are displayed
    expect(find.text('Not helpful'), findsOneWidget);
    expect(find.text('Too slow'), findsOneWidget);
    expect(find.text('Too complicated'), findsOneWidget);

    // Tap on the 'Bad' rating option
    await tester.tap(find.text('Bad'));
    await tester.pumpAndSettle(); // Wait for the widget to settle after the tap

    // Verify that the feedback options for 'Bad' are displayed
    expect(find.text('Missing info'), findsOneWidget);
    expect(find.text('Needs improvement'), findsOneWidget);
    expect(find.text('Not user-friendly'), findsOneWidget);
  });
}
