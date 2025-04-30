# 📦 animated_feedback_rating

**A beautiful, animated Flutter package** to collect ratings and short feedback easily!  
Supports **emoji**, **icons**, and **dynamic feedback options** with smooth animations ✨

---

## ✨ Features
- ⭐ Different rating types (star, smiley, thumb, heart, etc.)
- 📝 Short, predefined feedback options after selecting a rating
- 🌟 Simple controller and model-based structure
- 🎨 Fully customizable
- 📱 Smooth animations
- 🔥 Easy integration

---

## 📸 Screenshots

| Rating Selection | Feedback Options |
|:----------------:|:----------------:|
| ![Rating Example](https://via.placeholder.com/200x200) | ![Feedback Example](https://via.placeholder.com/200x200) |

_(Replace these with real screenshots later.)_

---

## 🚀 Getting Started

Add dependency in your `pubspec.yaml`:

```yaml
dependencies:
  animated_feedback_rating: ^1.0.0
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

