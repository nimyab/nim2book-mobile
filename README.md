# 📖 nim2book: Читай, Учись, Погружайся!

Представь: ты открываешь любимую книгу на иностранном языке, и магия происходит! Оригинал и перевод бок о бок, слова оживают по касанию, а словарь растёт сам собой. nim2book - это не просто читалка, это твой личный гид в мир языков и историй. 🌟

[![Flutter](https://img.shields.io/badge/Flutter-3.9%2B-blue?logo=flutter)](https://flutter.dev)
[![Platforms](https://img.shields.io/badge/Android%20%2F%20iOS-mobile-green?logo=android&logoColor=white)](#)
[![Dart](https://img.shields.io/badge/Made%20with-Dart-0175C2?logo=dart)](https://dart.dev)
[![Stars](https://img.shields.io/github/stars/nimyab/nim2book-mobile?style=social)](https://github.com/nimyab/nim2book-mobile)

## 🚀 Почему nim2book - это must-have для полиглотов?
- **Иммерсивное чтение**: Оригинал и перевод на одном экране - понимай нюансы без переключений!
- **Мгновенный перевод**: Тапни на слово - и вот оно: определения, примеры, переводы. Сохрани в словарь одним жестом! 📝
- **Твой личный каталог**: Просматривай обложки, авторов, главы. Добавляй книги легко - загружай файл, и приложение всё переведёт. 📚
- **Словарь мечты**: Все сохранённые слова в одном месте с поиском. Учись эффективно!
- **Кросс-платформа**: Работает на Android и iOS, всегда с тобой.

![Скриншот чтения](assets/screenshots/reading_screen.png)  <!-- Добавь реальные скриншоты в assets/screenshots -->

## ⚡ Быстрый старт: От идеи к запуску за минуты!
1. **Требования**: Flutter SDK `^3.9.0`, Android Studio/Xcode, эмулятор или девайс.
2. Скопируй `.env.example` в `.env` и настрой:
   - `ENV=development` или `production`
   - `API_BASE_URL=https://<твой-бэкенд>`
   - `GOOGLE_CLIENT_ID=<...apps.googleusercontent.com>`
   - `GOOGLE_SERVER_CLIENT_ID=<...apps.googleusercontent.com>`
3. Установи зависимости: `flutter pub get`
4. Запусти: `flutter run`
5. Собери: `flutter build apk` для Android или `flutter build ios` для iOS.

Готово! Погрузись в чтение прямо сейчас. 🚀

## 🛠 Структура проекта: Всё на своих местах
- `lib/core/api` - Клиент API и модели данных.
- `lib/core/contexts` - Управление состоянием.
- `lib/core/services` - Сервисы для книг, словаря, тем, локализации и уведомлений.
- `lib/features` - Ключевые фичи: чтение, перевод, профиль.
- `lib/widgets` - Универсальные компоненты: карточки, свитчеры.

## 🤝 Вклад в проект
Любишь кодить? Заметил баг или хочешь добавить фичу? Создай Issue или Pull Request! Давай сделаем nim2book ещё круче вместе. 💪

Если что-то не так или есть идеи - пиши! 😊

## 📄 Лицензия
MIT License. Читай, модифицируй, делись!
