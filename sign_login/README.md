
# 🔐 Firebase Authentication App with Flutter

This Flutter application demonstrates user authentication and data storage using Firebase, providing login/signup functionality with secure password storage and Cloud Firestore integration.

---

## 🚀 Features

- 🔐 Email/Password Authentication  
- 🔒 Secure Password Storage  
- 🙍‍♂️ User Profile Management  
- 🗃️ Cloud Firestore Database Integration  
- ✅ Form Validation  
- 🔁 Session Management  
- 🔧 Easy Firebase Setup with CLI  

---


Project Structure:
```lib/
├── main.dart               # Entry point
├── firebase_options.dart   # Firebase configuration
├── models/                 # Data models
│   └── user_model.dart
├── services/               # Firebase services
│   ├── auth_service.dart
│   └── storage_service.dart
├── providers/              # State management
│   └── auth_provider.dart
├── screens/                # UI screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   └── splash_screen.dart
├── utils/                  # Utilities
│   ├── constants.dart
│   └── validators.dart
└── widgets/                # Reusable widgets
    ├── custom_button.dart
    └── custom_text_field.dart
```

## 🛠️ Setup Instructions

### Step 1: Create a Firebase Project

1. Go to the [Firebase Console](https://console.firebase.google.com/)
2. Click **"Add project"** and follow the setup wizard
3. Enter a project name and click **"Continue"**
4. Disable Google Analytics if not needed
5. Click **"Create project"** and wait for setup to complete


### Step 2: Set Up Firebase Authentication

1. In the Firebase Console, go to **Authentication** → Click **"Get started"**
2. Under **Sign-in method**, choose **"Email/Password"**
3. Toggle **Enable** and click **Save**

---

### Step 3: Create Cloud Firestore Database

1. Navigate to **Cloud Firestore Database**
2. Click **"Create database"**
3. Select **Start in test mode** (development only)
4. Choose your location and click **Enable**

---

### Step 4: Register Your Flutter App with Firebase

1. In the Firebase Console, go to **Project Settings (⚙️ icon)** → **Your apps**
2. Click the **Android icon** (or iOS if applicable)
3. Enter your app’s package name (e.g., `com.example.sign_login`)
4. Download `google-services.json`
5. Place it in your project at:  
	```
	android/app/google-services.json
	```

---

### Step 5: Install Firebase CLI

Make sure you have Node.js installed. Then run:

```bash
npm install -g firebase-tools
firebase login
```

---

### Step 6: Connect Firebase to Flutter

1. Install FlutterFire CLI:
```bash
dart pub global activate flutter_fire_cli
```

2. Configure Firebase in your Flutter project:
```bash
flutter_fire configure
```

This will generate the `firebase_options.dart` file.

---

### Step 7: Initialize Firebase in Your App

In your `main.dart`, ensure Firebase is initialized:

```dart
void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform,
	);
	runApp(MyApp());
}
```

---

### Step 8: Disable reCAPTCHA (Development Only)

For Android development with phone authentication, disable reCAPTCHA:

1. Open `android/app/build.gradle`
2. Inside `defaultConfig`, add:

```gradle
manifestPlaceholders = [
	'firebase_auth_web_client_id': 'your-client-id',
	'disableReCAPTCHA': 'true'
]
```

> ⚠️ For development only. Don't use in production.

---

## ▶️ Run the App

Make sure everything is set up, then:

```bash
flutter run
```

---
