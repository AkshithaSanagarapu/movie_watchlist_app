# Flutter Movie Watchlist App

A multi-screen Flutter application developed for **CW-02: Flutter Movie Watchlist App** in **CSC 4360/6360 – Mobile App Development**.

The application displays a collection of movies, allows users to view detailed information about each movie, and provides a graduate-level Watchlist feature for saving and removing movies during the current app session.

## Features

- Scrollable movie list on the Home Screen
- Local movie poster assets
- Movie title and cast information
- Navigation between Home and Details screens
- Movie object passed between screens
- Detailed movie information including:
  - Poster
  - Title
  - Cast
  - Synopsis
- Graduate Watchlist functionality
- Add movies to the Watchlist
- Remove movies from the Watchlist
- Separate Watchlist Screen
- Watchlist counter on the Home Screen
- Visual indicator for movies currently in the Watchlist
- Watchlist state retained while the app remains open
- Empty Watchlist state
- Material Design interface

## Graduate Watchlist Feature

As part of the graduate requirements, the application includes a Watchlist feature.

From the Details Screen, a movie can be added to or removed from the Watchlist.

The Home Screen displays the current number of saved movies and identifies movies that are already in the Watchlist.

The Watchlist Screen filters the movie collection and displays only movies whose `isWatchlisted` value is `true`.

Watchlist state is maintained during the current application session.

## Project Structure

```text
movie_watchlist_app/
├── assets/
│   └── images/
│       ├── dark_knight.jpg
│       ├── everything_everywhere.jpg
│       ├── inception.jpg
│       ├── interstellar.jpg
│       └── matrix.jpg
│
├── lib/
│   ├── data/
│   │   └── movies_data.dart
│   │
│   ├── models/
│   │   └── movie.dart
│   │
│   ├── screens/
│   │   ├── details_screen.dart
│   │   ├── home_screen.dart
│   │   └── watchlist_screen.dart
│   │
│   └── main.dart
│
├── test/
│   └── widget_test.dart
│
└── pubspec.yaml
```

## Application Screens

### Home Screen

The Home Screen displays the available movies in a scrollable list. Each movie includes its poster, title, and cast count.

Selecting a movie opens its Details Screen.

For graduate functionality, the Home Screen also includes a Watchlist button with the current number of saved movies. Movies already saved display an **In Watchlist** indicator.

### Details Screen

The Details Screen receives the selected `Movie` object through its constructor and displays:

- Movie poster
- Movie title
- Cast members
- Synopsis
- Add to Watchlist / Remove from Watchlist button

The screen uses a `StatefulWidget` so the Watchlist button can update immediately when the movie's state changes.

### Watchlist Screen

The Watchlist Screen displays only movies that have been added to the Watchlist.

The filtered list is created using:

```dart
sampleMovies.where((movie) => movie.isWatchlisted).toList();
```

If no movies have been added, an empty Watchlist message is displayed.

Users can also open a movie directly from the Watchlist Screen and remove it from their Watchlist.

## Movie Model

Each movie is represented using a `Movie` model containing:

```dart
final String title;
final List<String> cast;
final String synopsis;
final String posterPath;
bool isWatchlisted;
```

The `isWatchlisted` property is used for the graduate Watchlist functionality.

## Navigation and Data Passing

Flutter's `Navigator.push()` and `MaterialPageRoute` are used for navigation.

The selected movie object is passed directly to the Details Screen:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsScreen(
      movie: movie,
    ),
  ),
);
```

This allows the Details Screen to render information for the selected movie without duplicating movie data.

## Assets

Movie posters are stored locally inside:

```text
assets/images/
```

The asset directory is declared in `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/images/
```

Images are displayed in the application using `Image.asset()`.

## Running the Project

Make sure Flutter is installed and a supported device is available.

Install the project dependencies:

```bash
flutter pub get
```

Check the project for issues:

```bash
flutter analyze
```

Run the tests:

```bash
flutter test
```

Run the application in Chrome:

```bash
flutter run -d chrome
```

## Testing

Before final submission, the project was verified using:

```bash
flutter analyze
flutter test
```

The project completed analysis with no issues and all Flutter tests passed.

The following application flow was also manually tested:

```text
Home Screen
    ↓
Select Movie
    ↓
Details Screen
    ↓
Add to Watchlist
    ↓
Return to Home
    ↓
Open Watchlist
    ↓
View Saved Movies
    ↓
Open Saved Movie
    ↓
Remove from Watchlist
```

## Technologies Used

- Flutter
- Dart
- Material Design
- Git
- GitHub

## Author

**Akshitha Sainath Sanagarapu (Panther ID: 003027780)**

Graduate Student  
Georgia State University

CSC 4360/6360 – Mobile App Development  
Fall 2026