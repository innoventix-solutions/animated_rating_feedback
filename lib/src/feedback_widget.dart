import 'package:animated_rating_feedback/animated_rating_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AnimatedFeedbackRating extends StatefulWidget {
  final RatingController controller;

  const AnimatedFeedbackRating({super.key, required this.controller});

  @override
  _AnimatedFeedbackRatingState createState() => _AnimatedFeedbackRatingState();
}

class _AnimatedFeedbackRatingState extends State<AnimatedFeedbackRating> {
  late FlutterTts _flutterTts; // Declare flutter_tts instance
  final Set<String> _selectedFeedback = <String>{}; // Track selected feedback
  String? _selectedEmojiId; // Track the currently selected emoji ID

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts(); // Initialize the FlutterTts instance
    _flutterTts.setLanguage("en-US");
    _flutterTts.setSpeechRate(0.8); // Adjust speech rate
    _flutterTts.setPitch(1.0); // Set pitch level
  }

  // Speak the selected feedback or emoji
  void _speakFeedback(String text) async {
    await _flutterTts.speak(text); // Trigger TTS immediately
  }

  // Stop the TTS if it's speaking
  void _stopSpeaking() async {
    await _flutterTts.stop(); // Stop any ongoing speech
  }

  // Handle emoji selection (speak emoji and toggle selection)
  void _handleEmojiSelection(RatingOption item) {
    bool isSelected = _selectedEmojiId == item.id;

    // Trigger TTS only when selected, not when deselected
    if (!isSelected) {
      _speakFeedback(item.label); // Speak when selecting
    } else {
      _stopSpeaking(); // Stop TTS when deselected
    }

    setState(() {
      // If the emoji is not selected, select it, otherwise deselect it
      if (_selectedEmojiId == item.id) {
        _selectedEmojiId = null; // Deselect if it's already selected
      } else {
        _selectedEmojiId = item.id; // Select the new emoji
      }
    });

    // Toggle the emoji selection
    widget.controller.setRating(item);
  }

  // Handle feedback selection (allowing toggle between select/deselect)
  void _handleFeedbackSelection(FeedbackItem item) {
    bool isSelected = _selectedFeedback.contains(item.id);

    // Trigger TTS only when selected, not when deselected
    if (!isSelected) {
      _speakFeedback(item.text); // Speak when selecting
    } else {
      _stopSpeaking(); // Stop TTS when deselected
    }

    setState(() {
      // Toggle the feedback selection (select or unselect)
      if (!isSelected) {
        _selectedFeedback.add(item.id); // Mark feedback as selected
      } else {
        _selectedFeedback.remove(item.id); // Deselect feedback
      }
    });

    widget.controller.toggleFeedback(item);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ---------------------- Rating Section ----------------------
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.0, // Space between emojis
              children:
                  widget.controller.ratingOptions.map((item) {
                    final isSelected =
                        _selectedEmojiId ==
                        item.id; // Check if emoji is selected

                    return GestureDetector(
                      onTap: () {
                        _handleEmojiSelection(
                          item,
                        ); // Handle emoji selection and TTS
                      },
                      child: AnimatedScale(
                        scale:
                            isSelected ? 1.5 : 1, // Animate the selected emoji
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          /* decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.teal.shade300
                            : Colors.transparent, // Darker color when selected
                        borderRadius: BorderRadius.circular(8),
                      ) */
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                item.emoji, // Display the emoji
                                style: TextStyle(
                                  fontSize: 30,
                                  color:
                                      isSelected ? Colors.teal : Colors.black,
                                ),
                              ),
                              Text(
                                item.label, // Display the label
                                style: TextStyle(
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color: isSelected ? Colors.teal : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),

            // ---------------------- Feedback Section ----------------------
            if (widget.controller.selectedRating != null &&
                widget.controller.feedbackMap.containsKey(
                  widget.controller.selectedRating!.id,
                ))
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children:
                    widget
                        .controller
                        .feedbackMap[widget.controller.selectedRating!.id]!
                        .map((item) {
                          final isSelected = _selectedFeedback.contains(
                            item.id,
                          );

                          return GestureDetector(
                            onTap: () {
                              _handleFeedbackSelection(
                                item,
                              ); // Handle feedback selection and TTS
                            },
                            child: ChoiceChip(
                              label: Text(item.text),
                              selected: isSelected,
                              selectedColor: Colors.teal.shade100,
                              backgroundColor: Colors.grey.shade100,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.teal : Colors.black,
                              ),
                            ),
                          );
                        })
                        .toList(),
              ),
          ],
        );
      },
    );
  }
}
