// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get vipRequired => 'Эта функция доступна только для VIP пользователей';

  @override
  String get login => 'Войти';

  @override
  String get loginWithGoogle => 'Войти с помощью Google';

  @override
  String get register => 'Регистрация';

  @override
  String get email => 'Электронная почта';

  @override
  String get password => 'Пароль';

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
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get add => 'Добавить';

  @override
  String get close => 'Закрыть';

  @override
  String get chapter => 'Глава';

  @override
  String get loginFailed => 'Ошибка входа';

  @override
  String get registrationFailed => 'Ошибка регистрации';

  @override
  String get loginButton => 'ВОЙТИ';

  @override
  String get registerButton => 'ЗАРЕГИСТРИРОВАТЬСЯ';

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
  String get readBook => 'Читать';

  @override
  String get profile => 'Профиль';

  @override
  String get translationNotFound => 'Перевод не найден';

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
  String get fileSelectionError => 'Ошибка при выборе файла';

  @override
  String get bookUploadError => 'Ошибка при загрузке книги';

  @override
  String get learnNewWords => 'Учить новые слова';

  @override
  String get reviewWords => 'Повторить слова';

  @override
  String get mixedMode => 'Смешанный режим';

  @override
  String get learning => 'Изучение';

  @override
  String get noNewWordsToday => 'Нет новых слов для изучения сегодня';

  @override
  String get noReviewWordsDue => 'Нет слов к повторению';

  @override
  String get noMixedSessionAvailable => 'Нет слов для смешанного режима';

  @override
  String wordProgress(int current, int total) {
    return 'Слово $current из $total';
  }

  @override
  String get examplesLabel => 'Примеры:';

  @override
  String get tapToTranslate => 'Нажмите для перевода';

  @override
  String get swipeInstructions => 'Свайп влево: Не знаю • Свайп вправо: Знаю';

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
  String get textAlignment => 'Выравнивание текста';

  @override
  String get alignLeft => 'По левому краю';

  @override
  String get alignCenter => 'По центру';

  @override
  String get alignRight => 'По правому краю';

  @override
  String get alignJustify => 'По ширине';

  @override
  String translationVerticalPaddingPx(int px) {
    return 'Вертикальные отступы перевода: $px px';
  }

  @override
  String get translationFont => 'Шрифт перевода';

  @override
  String translationFontSizeValue(int size) {
    return 'Размер шрифта перевода: $size';
  }

  @override
  String get enterWordHint => 'Введите слово';

  @override
  String get logoutFailed => 'Ошибка выхода';

  @override
  String get bookLoadFailed => 'Не удалось загрузить данные книги.';

  @override
  String get notAvailable => 'Нет данных';

  @override
  String reviewDueToday(int count) {
    return 'К повторению сегодня: $count';
  }

  @override
  String get period => 'Период';

  @override
  String get chartLegendTotal => 'Всего';

  @override
  String get chartLegendLearned => 'Выучено';

  @override
  String get chartLegendRepeated => 'Повторено';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get newWord => 'Новое слово';

  @override
  String get reviewWord => 'Повторение';

  @override
  String get pronounce => 'Прослушать';

  @override
  String get personalBooks => 'Личные книги';

  @override
  String get sharedBooks => 'Общие книги';
}
