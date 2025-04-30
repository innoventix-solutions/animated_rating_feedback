import 'package:animated_rating_feedback/animated_rating_feedback.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Feedback Rating', // App title
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Rate Your Experience')),
        body: const Center(child: FeedbackRatingExample()),
      ),
    );
  }
}

// Example usage of AnimatedFeedbackRating widget
class FeedbackRatingExample extends StatefulWidget {
  const FeedbackRatingExample({super.key});

  @override
  State<FeedbackRatingExample> createState() => _FeedbackRatingExampleState();
}

class _FeedbackRatingExampleState extends State<FeedbackRatingExample> {
  // Create a RatingController to manage the state
  RatingController<String> controller = RatingController<String>();

  @override
  void initState() {
    super.initState();

    // Initialize the controller with rating options and feedback options
    controller = RatingController<String>(
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
          FeedbackItem(
            id: 'f11',
            text: "Decent experience",
          ), // New feedback for rating '3'
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
  }

  @override
  Widget build(BuildContext context) {
    // Build the AnimatedFeedbackRating widget using controller
    return AnimatedFeedbackRating(controller: controller);
  }
}

///flutter run -d chrome --target=lib/main.dart
