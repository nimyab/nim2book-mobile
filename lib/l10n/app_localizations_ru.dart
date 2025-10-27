// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Nim2Book';

  @override
  String get login => 'Войти';

  @override
  String get register => 'Регистрация';

  @override
  String get email => 'Электронная почта';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get books => 'Книги';

  @override
  String get myBooks => 'Мои книги';

  @override
  String get dictionary => 'Словарь';

  @override
  String get settings => 'Настройки';

  @override
  String get theme => 'Тема';

  @override
  String get language => 'Язык';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get system => 'Системная';

  @override
  String get logout => 'Выйти';

  @override
  String get search => 'Поиск';

  @override
  String get loading => 'Загрузка...';

  @override
  String get error => 'Ошибка';

  @override
  String get retry => 'Повторить';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get edit => 'Редактировать';

  @override
  String get add => 'Добавить';

  @override
  String get close => 'Закрыть';

  @override
  String get readingProgress => 'Прогресс чтения';

  @override
  String get chapter => 'Глава';

  @override
  String get page => 'Страница';

  @override
  String get loginFailed => 'Ошибка входа';

  @override
  String get registrationFailed => 'Ошибка регистрации';

  @override
  String get loginButton => 'ВОЙТИ';

  @override
  String get registerButton => 'ЗАРЕГИСТРИРОВАТЬСЯ';

  @override
  String get noAccountRegisterHere => 'Нет аккаунта? Зарегистрируйтесь здесь';

  @override
  String get alreadyHaveAccountLoginHere => 'Уже есть аккаунт? Войдите здесь';

  @override
  String get pleaseLoginOrRegister =>
      'Пожалуйста, войдите или зарегистрируйтесь';

  @override
  String get noBooksFound => 'Книги не найдены';

  @override
  String get bookNotFound => 'Книга не найдена';

  @override
  String get author => 'Автор';

  @override
  String get addToMyBooks => 'ДОБАВИТЬ В МОИ КНИГИ';

  @override
  String get addedToMyBooks => 'ДОБАВЛЕНО В МОИ КНИГИ';

  @override
  String get profile => 'Профиль';

  @override
  String get translationNotFound => 'Перевод не найден';

  @override
  String get inDictionary => 'В словаре';

  @override
  String get examples => 'Примеры';

  @override
  String get meanings => 'Значения';

  @override
  String get posNoun => 'сущ.';

  @override
  String get posAdjective => 'прил.';

  @override
  String get posVerb => 'гл.';

  @override
  String get posAdverb => 'нареч.';

  @override
  String get posParticiple => 'прич.';

  @override
  String get posConjunction => 'союз';

  @override
  String get posPreposition => 'предл.';

  @override
  String get posPronoun => 'мест.';

  @override
  String get noSavedWords => 'Нет сохраненных слов';

  @override
  String get addBook => 'Добавить книгу';

  @override
  String get selectEpubFile => 'Выберите файл EPUB для загрузки';

  @override
  String get tapToSelectFile => 'Нажмите для выбора файла';

  @override
  String get uploadBook => 'Загрузить книгу';

  @override
  String get pleaseSelectFile => 'Пожалуйста, выберите файл';

  @override
  String get bookUploadedSuccessfully => 'Книга успешно загружена';

  @override
  String get fileSelectionError => 'Ошибка при выборе файла';

  @override
  String get bookUploadError => 'Ошибка при загрузке книги';

  @override
  String get addingBooksVipOnly =>
      'Добавление книг доступно только VIP пользователям';

  @override
  String get learnWords => 'Изучать слова';

  @override
  String get learning => 'Изучение';

  @override
  String get showAnswer => 'Показать ответ';

  @override
  String get nextWord => 'Следующее слово';

  @override
  String get previousWord => 'Предыдущее слово';

  @override
  String get noWordsToLearn =>
      'Нет слов для изучения. Сначала добавьте слова в словарь!';

  @override
  String wordProgress(int current, int total) {
    return 'Слово $current из $total';
  }

  @override
  String get examplesLabel => 'Примеры:';

  @override
  String get noTranslationAvailable => 'Перевод недоступен';

  @override
  String get tapToTranslate => 'Нажмите для перевода';

  @override
  String get swipeInstructions => 'Свайп влево: Не знаю • Свайп вправо: Знаю';

  @override
  String get knowLabel => 'ЗНАЮ';

  @override
  String get dontKnowLabel => 'НЕ ЗНАЮ';

  @override
  String get translate => 'Перевести';

  @override
  String get dontKnow => 'Не знаю';

  @override
  String get know => 'Знаю';

  @override
  String get menu => 'Меню';

  @override
  String get bookTextSettings => 'Текст книги';

  @override
  String get font => 'Шрифт';

  @override
  String get reset => 'Сброс';

  @override
  String fontSizeValue(int size) {
    return 'Размер шрифта: $size';
  }

  @override
  String get backgroundColor => 'Цвет фона';

  @override
  String get textColor => 'Цвет текста';

  @override
  String lineHeightValue(String value) {
    return 'Межстрочный интервал: $value';
  }

  @override
  String sidePaddingPx(int px) {
    return 'Отступ по краям: $px px';
  }

  @override
  String firstLineIndentEm(String em) {
    return 'Отступ начала абзаца: $em em';
  }

  @override
  String paragraphSpacingPx(int px) {
    return 'Отступ между абзацами: $px px';
  }

  @override
  String get parallelTranslationHorizontalScroll =>
      'Параллельный перевод (горизонтальный скролл)';

  @override
  String get resetPosition => 'Сброс положения';
}
