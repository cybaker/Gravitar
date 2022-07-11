A casual game in Flutter intended as a web app, based on Flutter's Casual Game toolkit and Flame.

Gravitar - based on the 1982 Atari coin op vector graphic game

![Status](https://github.com/cybaker/Gravitar/actions/workflows/publish.yaml/badge.svg)

# Getting started

This link launches a web app in your browser.

[Launch the web app](https://cybaker.github.io/Gravitar/)

The game has some levels of play: Normal gravity, Negative gravity, Normal gravity invisible, Negative gravity invisible
Each level consists of a star system with planets each of which need to be conquered. A level has fixed player and enemy properties like fire rate, gravity pull, etc.
In a planet there is ground, enemy bases, and fuel depots.

Tap play, select a level, and fly your ship to collect fuel and destroy enemy bases.
Use the arrow keys for movement:
- turn left (left arrow).
- turn right (right arrow).
- thrust (up arrow).
- fire (F)
- shield and fuel tractor beam (spacebar).

![Screenshot](https://github.com/cybaker/Gravitar/blob/main/assets/docs/screenshot.jpg)

# Development

To run the app in debug mode:

    flutter run

This assumes you have an Android emulator, iOS Simulator, or an attached physical device.

To run in a browser:

    flutter run -d chrome

## Building for production

Once a PR is merged to main, the web app will automatically build and deploy to the app link above.
This repo uses the Git actions by [bluefireteam](https://github.com/bluefireteam/flutter-gh-pages)

# Integrations

See [Flutter's Casual Game toolkit](https://docs.flutter.dev/resources/games-toolkit). 