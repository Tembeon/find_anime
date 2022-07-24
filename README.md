# FindAnime

This project was built as BLoC training. 

## Description

Find anime name by image URL. 

Try it:
* Web - https://tembeon.github.io/find_anime/
* Android - https://github.com/Tembeon/find_anime/releases/latest

## Features
* Search by an image url
* Install as app to your device
* Search engine by https://trace.moe/about

### I learned how to:
* generate models with [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable) packages
* bring l10n support with [Intl](https://pub.dev/packages/intl) and flutter_localizations packages
* use [bloc](https://pub.dev/packages/bloc) with flutter

## How to build
1. Clone repo
2. run `flutter pub get`
3. run `flutter pub run build_runner build`
4. build project to web or mobile

### TO-DO
- [X] Add search via file drop
- [ ] Add ability to choose app language
- [ ] Add ability to choose app theme
- [ ] Maybe: search via Ctrl + V image
- [ ] Maybe: get image via mobile sharing dialog
- [ ] Maybe: compile on Windows, Android, Linux