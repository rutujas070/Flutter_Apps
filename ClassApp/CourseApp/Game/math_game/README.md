# Math Game Flutter App

## App Overview
A simple Flutter math game where users answer random math questions under a countdown timer. 
Tracks scores and stores high scores locally.

## Features
- Random math questions
- Countdown timer per question
- Score tracking
- Local storage for high scores
- Result screen after 10 questions

## How Local Storage is Used
Uses a `LocalStorageService` (SharedPreferences) to:
- Save high scores after the game ends
- Load high scores when the app starts

## How Game Logic Works
1. Random question generated
2. Timer starts for each question
3. User selects an answer:
   - Correct → score increases
   - Wrong or timeout → no points
4. After 10 questions → show Result Screen
5. Option to restart the game

## Dependencies
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  shared_preferences: ^2.2.2
  lottie: ^3.1.3
  google_fonts: ^8.0.0

## Demo
- Short demo video: [short_demo.mp4](short_demo.mp4)


