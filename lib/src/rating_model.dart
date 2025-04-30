import 'package:flutter/material.dart'; // For IconData

// Model class for Rating Option (e.g. Emoji + Label + Icon)
class RatingOption<T> {
  final String id; // Unique identifier for rating
  final String label; // Label shown under the icon (e.g., Good, Bad, Excellent)
  final T value; // Generic value (can be String/int/etc.)
  final String emoji; // Emoji to visually represent the rating
  final IconData icon; // Icon if you want to use Icon instead of emoji

  RatingOption({
    required this.id,
    required this.label,
    required this.value,
    required this.emoji,
    required this.icon,
  });
}

// Model class for Feedback Item (Short feedback lines after rating selection)
class FeedbackItem {
  final String id; // Unique ID for feedback option
  final String
  text; // Feedback text (e.g., "Quick response", "Needs improvement")

  FeedbackItem({required this.id, required this.text});
}
