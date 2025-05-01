# 📦 animated_feedback_rating with TTS 🔊

**A beautiful, animated Flutter package** to collect ratings and short feedback easily with TTS! 🔊
Supports **emoji**, **icons**, and **dynamic feedback options** with smooth animations ✨

---

## ✨ Features
- ⭐ Different rating types (star, smiley, thumb, heart, etc.)
- 📝 Short, predefined feedback options after selecting a rating
- 🌟 Simple controller and model-based structure
- 🎨 Fully customizable
- 📱 Smooth animations
- 🔥 Easy integration
-🎤 Text to Speech (TTS) functionality to speak feedback and rating choices


📸 Screenshot

<img src="assets/Screenshot_1.png" alt="Screenshot 2" width="200"/>

<img src="assets/Screenshot_2.png" alt="Screenshot 3" width="200"/>

<img src="assets/Screenshot_3.png" alt="Screenshot 4" width="200"/>


▶ Demo Video

Check out the demo videos for the package:

[![Watch the video](https://img.youtube.com/vi/9c93fJ3yyyY/0.jpg)](https://www.youtube.com/shorts/fAsaudVLIgM)

_This video demonstrates the Text to Speech feature in action with Emoji._

[![Watch the video](https://img.youtube.com/vi/3ZFJjEoIv6U/0.jpg)](https://www.youtube.com/shorts/68o1ZSSANvw)

_This video demonstrates the Text to Speech feature in action with Star._
---

## 🚀 Getting Started

Add dependency in your `pubspec.yaml`:

```yaml
dependencies:
  animated_feedback_rating: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🛠️ How to Use

### 1. Initialize Controller

```dart
final controller = RatingController<String>(
  ratingOptions: [
    RatingOption(id: '1', label: 'Terrible', value: 'terrible', emoji: '😞', icon: Icons.sentiment_very_dissatisfied),
    RatingOption(id: '2', label: 'Bad', value: 'bad', emoji: '😟', icon: Icons.sentiment_dissatisfied),
    RatingOption(id: '3', label: 'Okay', value: 'okay', emoji: '😐', icon: Icons.sentiment_neutral),
    RatingOption(id: '4', label: 'Good', value: 'good', emoji: '😊', icon: Icons.sentiment_satisfied),
    RatingOption(id: '5', label: 'Excellent', value: 'excellent', emoji: '😍', icon: Icons.sentiment_very_satisfied),
  ],
  feedbackOptionsMap: {
    '1': [FeedbackItem(id: 'f1', text: 'Not helpful'), FeedbackItem(id: 'f2', text: 'Too slow')],
    '5': [FeedbackItem(id: 'f3', text: 'Excellent help!'), FeedbackItem(id: 'f4', text: 'Very fast')],
  },
);
```

---

### 2. Use Widget

```dart
AnimatedFeedbackRating<String>(
  controller: controller,
)
```

---

### RatingController
- `ratingOptions` → List of selectable rating options
- `feedbackMap` → Map of feedback options based on rating
- `setRating`, `toggleFeedback`, `clear`

### RatingOption
- `id`, `label`, `value`, `emoji`, `icon`

### FeedbackItem
- `id`, `text`

---

## 📹 Video Demo
_(Optional: Add video URL after you record!)_

---

## 🤝 Contributing
Pull requests are welcome!  
Feel free to open an issue if you find a bug or want a feature!

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).

---

# 🚀 Made with Flutter ❤️

