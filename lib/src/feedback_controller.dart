// feedback_controller.dart
// Controller to manage Rating and Feedback logic

import 'package:flutter/material.dart';

import 'rating_model.dart'; // Import RatingOption and FeedbackItem models

/// Controller class to handle rating options and feedback selections
class RatingController<T> extends ChangeNotifier {
  List<RatingOption<T>> _ratingOptions;
  Map<String, List<FeedbackItem>> _feedbackMap;

  RatingOption<T>? selectedRating; // Currently selected rating
  List<FeedbackItem> selectedFeedback = []; // Currently selected feedback list

  /// Constructor with optional initial values
  RatingController({
    List<RatingOption<T>>? ratingOptions,
    Map<String, List<FeedbackItem>>? feedbackOptionsMap,
  }) : _ratingOptions = ratingOptions ?? [],
       _feedbackMap = feedbackOptionsMap ?? {};

  // ---------------------- Getters ----------------------

  /// Get the list of available rating options
  List<RatingOption<T>> get ratingOptions => _ratingOptions;

  /// Get the feedback options mapped by rating ID
  Map<String, List<FeedbackItem>> get feedbackMap => _feedbackMap;

  // ---------------------- Setters / Mutators ----------------------

  /// Set or update the available rating options
  void setRatingOptions(List<RatingOption<T>> options) {
    _ratingOptions = options;
    notifyListeners();
  }

  /// Set or update the feedback mapping
  void setFeedbackMap(Map<String, List<FeedbackItem>> map) {
    _feedbackMap = map;
    notifyListeners();
  }

  /// Set the selected rating and clear any previous feedback selections
  void setRating(RatingOption<T> rating) {
    selectedRating = rating;
    selectedFeedback.clear();
    notifyListeners();
  }

  /// Toggle a feedback item selection
  void toggleFeedback(FeedbackItem feedbackItem) {
    if (selectedFeedback.contains(feedbackItem)) {
      selectedFeedback.remove(feedbackItem);
    } else {
      selectedFeedback.add(feedbackItem);
    }
    notifyListeners();
  }

  /// Clear all selections (both rating and feedback)
  void clear() {
    selectedRating = null;
    selectedFeedback.clear();
    notifyListeners();
  }
}
