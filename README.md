# Card Game

A simple iOS card game built with SwiftUI where you compete against the computer by drawing cards. The highest card wins the round, and the first to reach 10 points wins the game.

## Features

- Player vs Computer card battle
- Score tracking with win condition (first to 10 points)
- Animated result messages
- Clean MVVM architecture

## Screenshots

> Add a screenshot here after running the app on a simulator

## Requirements

- iOS 17+
- Xcode 16+
- Swift 5.9+

## How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/Mendezoov/card-game.git
   ```
2. Open `Card Game.xcodeproj` in Xcode
3. Select a simulator or connected device
4. Press `Cmd + R` to build and run

## Architecture

Built using the **MVVM** (Model-View-ViewModel) pattern:

- `CardGameModels.swift` — Data models (`Card`, `Player`, `GameResult`)
- `CardGameViewModel.swift` — Game logic and state management
- `ContentView.swift` — SwiftUI views

## How to Play

1. Tap **Deal** to draw a card against the computer
2. The higher card wins the round and earns a point
3. First player to reach **10 points** wins
4. Tap **Clear Results** to reset the game

## License

MIT License — feel free to use this project for learning.
