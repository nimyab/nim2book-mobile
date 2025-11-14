// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Nim2Book';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get books => 'Books';

  @override
  String get myBooks => 'My Books';

  @override
  String get dictionary => 'Dictionary';

  @override
  String get settings => 'Settings';

  @override
  String get dailyNewWordsLimit => 'Daily new words limit';

  @override
  String get dailyLimitReached =>
      'Daily limit reached. Come back tomorrow or review existing words.';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get logout => 'Logout';

  @override
  String get search => 'Search';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get close => 'Close';

  @override
  String get readingProgress => 'Reading Progress';

  @override
  String get chapter => 'Chapter';

  @override
  String get page => 'Page';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get registrationFailed => 'Registration failed';

  @override
  String get loginButton => 'LOGIN';

  @override
  String get registerButton => 'REGISTER';

  @override
  String get noAccountRegisterHere => 'No account? Register here';

  @override
  String get alreadyHaveAccountLoginHere =>
      'Already have an account? Login here';

  @override
  String get pleaseLoginOrRegister => 'Please login or register';

  @override
  String get noBooksFound => 'No books found';

  @override
  String get bookNotFound => 'Book not found';

  @override
  String get offlineMode => 'Offline mode';

  @override
  String get offlineModeDesc => 'Use cached content only; network disabled';

  @override
  String get offlineBannerTitle => 'Offline mode';

  @override
  String get offlineBannerMessage =>
      'Network requests disabled. Only cached content is available.';

  @override
  String get offlineCatalogUnavailable => 'Book catalog is unavailable offline';

  @override
  String get author => 'Author';

  @override
  String get addToMyBooks => 'ADD TO MY BOOKS';

  @override
  String get addedToMyBooks => 'ADDED TO MY BOOKS';

  @override
  String get readBook => 'Read';

  @override
  String get profile => 'Profile';

  @override
  String get translationNotFound => 'Translation not found';

  @override
  String get inDictionary => 'In dictionary';

  @override
  String get examples => 'Examples';

  @override
  String get meanings => 'Meanings';

  @override
  String get posNoun => 'noun';

  @override
  String get posAdjective => 'adj.';

  @override
  String get posVerb => 'verb';

  @override
  String get posAdverb => 'adv.';

  @override
  String get posParticiple => 'part.';

  @override
  String get posConjunction => 'conj.';

  @override
  String get posPreposition => 'prep.';

  @override
  String get posPronoun => 'pron.';

  @override
  String get noSavedWords => 'No saved words';

  @override
  String get addBook => 'Add Book';

  @override
  String get selectEpubFile => 'Select an EPUB file to upload';

  @override
  String get tapToSelectFile => 'Tap to select file';

  @override
  String get uploadBook => 'Upload Book';

  @override
  String get pleaseSelectFile => 'Please select a file';

  @override
  String get bookUploadedSuccessfully => 'Book uploaded successfully';

  @override
  String get fileSelectionError => 'File selection error';

  @override
  String get bookUploadError => 'Book upload error';

  @override
  String get addingBooksVipOnly =>
      'Adding books is available only to VIP users';

  @override
  String get learnWords => 'Learn Words';

  @override
  String get learnNewWords => 'Learn new words';

  @override
  String get reviewWords => 'Review words';

  @override
  String get mixedMode => 'Mixed mode';

  @override
  String get learning => 'Learning';

  @override
  String get showAnswer => 'Show Answer';

  @override
  String get nextWord => 'Next Word';

  @override
  String get previousWord => 'Previous Word';

  @override
  String get noWordsToLearn =>
      'No words to learn. Add some words to your dictionary first!';

  @override
  String get noNewWordsToday => 'No new words to learn today';

  @override
  String get noReviewWordsDue => 'No words due for review';

  @override
  String get noMixedSessionAvailable => 'No words available for mixed session';

  @override
  String wordProgress(int current, int total) {
    return 'Word $current of $total';
  }

  @override
  String get examplesLabel => 'Examples:';

  @override
  String get noTranslationAvailable => 'No translation available';

  @override
  String get tapToTranslate => 'Tap to translate';

  @override
  String get swipeInstructions => 'Swipe left: Don\'t know • Swipe right: Know';

  @override
  String get knowLabel => 'KNOW';

  @override
  String get dontKnowLabel => 'DON\'T KNOW';

  @override
  String get translate => 'Translate';

  @override
  String get dontKnow => 'Don\'t Know';

  @override
  String get know => 'Know';

  @override
  String get menu => 'Menu';

  @override
  String get bookTextSettings => 'Book text';

  @override
  String get font => 'Font';

  @override
  String get reset => 'Reset';

  @override
  String fontSizeValue(int size) {
    return 'Font size: $size';
  }

  @override
  String get backgroundColor => 'Background color';

  @override
  String get textColor => 'Text color';

  @override
  String lineHeightValue(String value) {
    return 'Line height: $value';
  }

  @override
  String sidePaddingPx(int px) {
    return 'Side padding: $px px';
  }

  @override
  String firstLineIndentEm(String em) {
    return 'First line indent: $em em';
  }

  @override
  String paragraphSpacingPx(int px) {
    return 'Paragraph spacing: $px px';
  }

  @override
  String get parallelTranslationHorizontalScroll =>
      'Parallel translation (horizontal scroll)';

  @override
  String get resetPosition => 'Reset position';

  @override
  String get textAlignment => 'Text alignment';

  @override
  String get alignLeft => 'Left';

  @override
  String get alignCenter => 'Center';

  @override
  String get alignRight => 'Right';

  @override
  String get alignJustify => 'Justify';

  @override
  String translationVerticalPaddingPx(int px) {
    return 'Translation vertical padding: $px px';
  }

  @override
  String get translationFont => 'Translation font';

  @override
  String translationFontSizeValue(int size) {
    return 'Translation font size: $size';
  }

  @override
  String get enterWordHint => 'Enter a word';

  @override
  String get logoutFailed => 'Logout failed';

  @override
  String get bookLoadFailed => 'Failed to load book data.';

  @override
  String get notAvailable => 'N/A';

  @override
  String get hard => 'Hard';

  @override
  String get easy => 'Easy';

  @override
  String reviewDueToday(int count) {
    return 'Due today: $count';
  }

  @override
  String get statistics => 'Statistics';

  @override
  String get showStatistics => 'Show learning statistics';

  @override
  String studyStreakDays(int days) {
    return 'You are learning words for $days days';
  }

  @override
  String recordStreakDays(int days) {
    return 'Record $days days';
  }

  @override
  String learnedTodayProgress(int used, int limit) {
    return 'Learned today $used/$limit';
  }

  @override
  String get period => 'Period';

  @override
  String get period7Days => '7 days';

  @override
  String get period30Days => '30 days';

  @override
  String get period90Days => '90 days';

  @override
  String get periodThisYear => 'This year';

  @override
  String get periodAllTime => 'All time';

  @override
  String activeLearningCount(int count) {
    return 'Currently learning: $count';
  }

  @override
  String activeNewTodayCount(int count) {
    return 'Studying now: $count new words';
  }

  @override
  String totalLearnedWords(int count) {
    return 'Total learned words: $count';
  }

  @override
  String totalRepeatedWords(int count) {
    return 'Total repeated words: $count';
  }

  @override
  String totalKnownWords(int count) {
    return 'Total already known words: $count';
  }

  @override
  String get chartCaption => 'Days vs. words';

  @override
  String get periodStatsHeader => 'For selected period';

  @override
  String get chartAxisDays => 'Days';

  @override
  String get chartAxisWords => 'Number of words';

  @override
  String get chartLegendPeriod => 'For period';

  @override
  String get chartLegendTotal => 'Total';

  @override
  String get chartLegendLearned => 'Learned';

  @override
  String get chartLegendRepeated => 'Repeated';

  @override
  String get chartLegendKnown => 'Known';

  @override
  String periodFirstLearnedWords(int count) {
    return 'First learned: $count';
  }

  @override
  String periodRepeatedWords(int count) {
    return 'Repeated: $count';
  }

  @override
  String periodBecameKnownWords(int count) {
    return 'Became known: $count';
  }

  @override
  String get noResults => 'No results';

  @override
  String get newWord => 'New Word';

  @override
  String get reviewWord => 'Review';

  @override
  String wordLevel(int level) {
    return 'Level $level';
  }

  @override
  String nextReviewDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return 'Next review: $days $_temp0';
  }

  @override
  String get pronounce => 'Pronounce';
}
