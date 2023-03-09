<h1 align="center">About</h1>

# Run project
## - Android, iOS:
```sh
flutter run lib/main.dart
```

<br />

# Run sorting imports
```sh
flutter pub run import_sorter:main
```

<br />

# Модуль 18. Media, cards, webview

#### Задание

1. Реализовать приложение-браузер, позволяющее навигировать на URL внутри приложения.

2. В шапке страницы добавить поле ввода URL, а также кнопки Reload / Stop loading, Back и Forward:

    - Reload должна перезагружать страницу.

    - В то время, как страница загружается, вместо Reload должна отображаться кнопка Stop loading.

    - Кнопки Back и Forward должны навигировать назад и вперёд соответственно. Если навигировать вперёд или назад невозможно, соответствующая кнопка должна иметь состояние Disabled.
