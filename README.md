# Flutter Localization Example

This project is designed as an example of implementing localization in Flutter. It demonstrates how to add multiple languages to your application using the `easy_localization` package.

---

## 📚 Features
- Multi-language support with easy configuration.
- Simple integration using the `easy_localization` package.
- JSON-based translation files for better scalability.

---

## 📊 Dependencies
- **easy_localization**: ^3.0.7

Make sure to add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  easy_localization: ^3.0.7
```

<img src="https://github.com/user-attachments/assets/1d15eebf-4969-4288-bb12-dfc1f6390a4a" alt="Dependency Image" width="400" />
<img src="https://github.com/user-attachments/assets/1e2c5210-6a88-468b-af0c-0f68f0a4dd0f" alt="App Demo" width="400" />
<img src="https://github.com/user-attachments/assets/544d7007-759e-4d1d-b036-c0a7d071c0c6" alt="Translation Example" width="400" />

---

## 🖒 Example Code
### **`main.dart`**
```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      startLocale: const Locale('uz', 'UZ'),
      child: const MyApp(),
    ),
  );
}
```

### **`page_1.dart`**
```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/core/constants/app_strings.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          AppStrings.appName.tr(),
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              AppStrings.word1.tr(),
              style: const TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.word2.tr(),
              style: const TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.word3.tr(),
              style: const TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('en', 'US'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "En",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('ru', 'RU'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Ru",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('uz', 'UZ'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Uz",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
```

---

## 🗃️ File Structure
The project has the following file structure for managing translations:

```plaintext
assets/
└── translations/
    ├── en-US.json
    ├── ru-RU.json
    └── uz-UZ.json
```

### Example JSON File
Here is an example of a `en-US.json` translation file:

```json
{
  "Hello world": "Hello world",
  "Hi Students": "Hi Students",
  "Version": "Version"
}
```

---

## 🚀 Try it Out!
Clone this repository and run the application:

```bash
git clone https://github.com/your-repo/flutter-localization-example.git
cd flutter-localization-example
flutter pub get
flutter run
```

---

## 🔧 Contributing
Contributions are welcome! Feel free to open issues or submit pull requests for any improvements or fixes.

---

## 🌐 Author
Check out my GitHub profile for more projects and updates:

[https://github.com/Baxa073](https://github.com/Baxa073)

