import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Nim2Book'**
  String get appTitle;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// First name field label
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Last name field label
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Books tab/screen title
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// My books tab/screen title
  ///
  /// In en, this message translates to:
  /// **'My Books'**
  String get myBooks;

  /// Dictionary tab/screen title
  ///
  /// In en, this message translates to:
  /// **'Dictionary'**
  String get dictionary;

  /// Settings tab/screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Daily new words limit setting label
  ///
  /// In en, this message translates to:
  /// **'Daily new words limit'**
  String get dailyNewWordsLimit;

  /// Shown on the learning screen when the daily new words limit has been reached
  ///
  /// In en, this message translates to:
  /// **'Daily limit reached. Come back tomorrow or review existing words.'**
  String get dailyLimitReached;

  /// Theme setting label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Language setting label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Search placeholder text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Edit button text
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Add button text
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Reading progress label
  ///
  /// In en, this message translates to:
  /// **'Reading Progress'**
  String get readingProgress;

  /// Chapter label
  ///
  /// In en, this message translates to:
  /// **'Chapter'**
  String get chapter;

  /// Page label
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// Login failed error message
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// Registration failed error message
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registrationFailed;

  /// Login button text (uppercase)
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginButton;

  /// Register button text (uppercase)
  ///
  /// In en, this message translates to:
  /// **'REGISTER'**
  String get registerButton;

  /// Link to register screen from login
  ///
  /// In en, this message translates to:
  /// **'No account? Register here'**
  String get noAccountRegisterHere;

  /// Link to login screen from register
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login here'**
  String get alreadyHaveAccountLoginHere;

  /// Message prompting user to authenticate
  ///
  /// In en, this message translates to:
  /// **'Please login or register'**
  String get pleaseLoginOrRegister;

  /// Message when no books are available
  ///
  /// In en, this message translates to:
  /// **'No books found'**
  String get noBooksFound;

  /// Error message when book is not found
  ///
  /// In en, this message translates to:
  /// **'Book not found'**
  String get bookNotFound;

  /// Title for offline mode toggle
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get offlineMode;

  /// Description for offline mode toggle
  ///
  /// In en, this message translates to:
  /// **'Use cached content only; network disabled'**
  String get offlineModeDesc;

  /// Banner title shown when offline mode is active
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get offlineBannerTitle;

  /// Banner message shown when offline mode is active
  ///
  /// In en, this message translates to:
  /// **'Network requests disabled. Only cached content is available.'**
  String get offlineBannerMessage;

  /// Message shown when books catalog cannot be loaded offline
  ///
  /// In en, this message translates to:
  /// **'Book catalog is unavailable offline'**
  String get offlineCatalogUnavailable;

  /// Author label
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// Button text to add book to user's library
  ///
  /// In en, this message translates to:
  /// **'ADD TO MY BOOKS'**
  String get addToMyBooks;

  /// Button text when book is already in user's library
  ///
  /// In en, this message translates to:
  /// **'ADDED TO MY BOOKS'**
  String get addedToMyBooks;

  /// Button text to start reading book
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get readBook;

  /// Profile screen title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Message when translation is not available
  ///
  /// In en, this message translates to:
  /// **'Translation not found'**
  String get translationNotFound;

  /// Label indicating word is in dictionary
  ///
  /// In en, this message translates to:
  /// **'In dictionary'**
  String get inDictionary;

  /// Examples label in translation dialog
  ///
  /// In en, this message translates to:
  /// **'Examples'**
  String get examples;

  /// Meanings label in translation dialog
  ///
  /// In en, this message translates to:
  /// **'Meanings'**
  String get meanings;

  /// Part of speech: noun
  ///
  /// In en, this message translates to:
  /// **'noun'**
  String get posNoun;

  /// Part of speech: adjective
  ///
  /// In en, this message translates to:
  /// **'adj.'**
  String get posAdjective;

  /// Part of speech: verb
  ///
  /// In en, this message translates to:
  /// **'verb'**
  String get posVerb;

  /// Part of speech: adverb
  ///
  /// In en, this message translates to:
  /// **'adv.'**
  String get posAdverb;

  /// Part of speech: participle
  ///
  /// In en, this message translates to:
  /// **'part.'**
  String get posParticiple;

  /// Part of speech: conjunction
  ///
  /// In en, this message translates to:
  /// **'conj.'**
  String get posConjunction;

  /// Part of speech: preposition
  ///
  /// In en, this message translates to:
  /// **'prep.'**
  String get posPreposition;

  /// Part of speech: pronoun
  ///
  /// In en, this message translates to:
  /// **'pron.'**
  String get posPronoun;

  /// Empty state message when dictionary has no saved words
  ///
  /// In en, this message translates to:
  /// **'No saved words'**
  String get noSavedWords;

  /// Add book screen title
  ///
  /// In en, this message translates to:
  /// **'Add Book'**
  String get addBook;

  /// Instruction text to select EPUB file
  ///
  /// In en, this message translates to:
  /// **'Select an EPUB file to upload'**
  String get selectEpubFile;

  /// Prompt to tap and select file
  ///
  /// In en, this message translates to:
  /// **'Tap to select file'**
  String get tapToSelectFile;

  /// Upload book button text
  ///
  /// In en, this message translates to:
  /// **'Upload Book'**
  String get uploadBook;

  /// Error message when no file is selected
  ///
  /// In en, this message translates to:
  /// **'Please select a file'**
  String get pleaseSelectFile;

  /// Success message after book upload
  ///
  /// In en, this message translates to:
  /// **'Book uploaded successfully'**
  String get bookUploadedSuccessfully;

  /// Error message when file selection fails
  ///
  /// In en, this message translates to:
  /// **'File selection error'**
  String get fileSelectionError;

  /// Error message when book upload fails
  ///
  /// In en, this message translates to:
  /// **'Book upload error'**
  String get bookUploadError;

  /// Message shown to non-VIP users
  ///
  /// In en, this message translates to:
  /// **'Adding books is available only to VIP users'**
  String get addingBooksVipOnly;

  /// Button text to start learning words
  ///
  /// In en, this message translates to:
  /// **'Learn Words'**
  String get learnWords;

  /// Card title for learning only new words
  ///
  /// In en, this message translates to:
  /// **'Learn new words'**
  String get learnNewWords;

  /// Card title for reviewing due words
  ///
  /// In en, this message translates to:
  /// **'Review words'**
  String get reviewWords;

  /// Card title for mixed mode (new + review)
  ///
  /// In en, this message translates to:
  /// **'Mixed mode'**
  String get mixedMode;

  /// Learning screen title
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get learning;

  /// Button text to reveal the translation
  ///
  /// In en, this message translates to:
  /// **'Show Answer'**
  String get showAnswer;

  /// Button text to go to next word
  ///
  /// In en, this message translates to:
  /// **'Next Word'**
  String get nextWord;

  /// Button text to go to previous word
  ///
  /// In en, this message translates to:
  /// **'Previous Word'**
  String get previousWord;

  /// Message when there are no words in dictionary to learn
  ///
  /// In en, this message translates to:
  /// **'No words to learn. Add some words to your dictionary first!'**
  String get noWordsToLearn;

  /// Message when there are no new words available for learning today
  ///
  /// In en, this message translates to:
  /// **'No new words to learn today'**
  String get noNewWordsToday;

  /// Message when there are no words due for review
  ///
  /// In en, this message translates to:
  /// **'No words due for review'**
  String get noReviewWordsDue;

  /// Message when there are no words for mixed mode
  ///
  /// In en, this message translates to:
  /// **'No words available for mixed session'**
  String get noMixedSessionAvailable;

  /// Progress indicator showing current word position
  ///
  /// In en, this message translates to:
  /// **'Word {current} of {total}'**
  String wordProgress(int current, int total);

  /// Label for examples section in word definitions
  ///
  /// In en, this message translates to:
  /// **'Examples:'**
  String get examplesLabel;

  /// Message when no translation is found for a word
  ///
  /// In en, this message translates to:
  /// **'No translation available'**
  String get noTranslationAvailable;

  /// Instruction to tap card to show translation
  ///
  /// In en, this message translates to:
  /// **'Tap to translate'**
  String get tapToTranslate;

  /// Instructions for swiping cards in learning mode
  ///
  /// In en, this message translates to:
  /// **'Swipe left: Don\'t know • Swipe right: Know'**
  String get swipeInstructions;

  /// Label for know action in learning mode (uppercase)
  ///
  /// In en, this message translates to:
  /// **'KNOW'**
  String get knowLabel;

  /// Label for don't know action in learning mode (uppercase)
  ///
  /// In en, this message translates to:
  /// **'DON\'T KNOW'**
  String get dontKnowLabel;

  /// Translate button text
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// Don't know button text
  ///
  /// In en, this message translates to:
  /// **'Don\'t Know'**
  String get dontKnow;

  /// Know button text
  ///
  /// In en, this message translates to:
  /// **'Know'**
  String get know;

  /// Overflow menu tooltip
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// Settings section title for book text
  ///
  /// In en, this message translates to:
  /// **'Book text'**
  String get bookTextSettings;

  /// Font label
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get font;

  /// Reset button text
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Font size with current value
  ///
  /// In en, this message translates to:
  /// **'Font size: {size}'**
  String fontSizeValue(int size);

  /// Background color label
  ///
  /// In en, this message translates to:
  /// **'Background color'**
  String get backgroundColor;

  /// Text color label
  ///
  /// In en, this message translates to:
  /// **'Text color'**
  String get textColor;

  /// Line height with current value
  ///
  /// In en, this message translates to:
  /// **'Line height: {value}'**
  String lineHeightValue(String value);

  /// Side padding with current value in px
  ///
  /// In en, this message translates to:
  /// **'Side padding: {px} px'**
  String sidePaddingPx(int px);

  /// First line indent with current value in em
  ///
  /// In en, this message translates to:
  /// **'First line indent: {em} em'**
  String firstLineIndentEm(String em);

  /// Paragraph spacing with current value in px
  ///
  /// In en, this message translates to:
  /// **'Paragraph spacing: {px} px'**
  String paragraphSpacingPx(int px);

  /// Parallel translation settings title
  ///
  /// In en, this message translates to:
  /// **'Parallel translation (horizontal scroll)'**
  String get parallelTranslationHorizontalScroll;

  /// Reset position button text
  ///
  /// In en, this message translates to:
  /// **'Reset position'**
  String get resetPosition;

  /// Label for text alignment setting
  ///
  /// In en, this message translates to:
  /// **'Text alignment'**
  String get textAlignment;

  /// Align left option
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get alignLeft;

  /// Align center option
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get alignCenter;

  /// Align right option
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get alignRight;

  /// Align justify option
  ///
  /// In en, this message translates to:
  /// **'Justify'**
  String get alignJustify;

  /// Parallel translation vertical padding (top & bottom)
  ///
  /// In en, this message translates to:
  /// **'Translation vertical padding: {px} px'**
  String translationVerticalPaddingPx(int px);

  /// Label for parallel translation font family
  ///
  /// In en, this message translates to:
  /// **'Translation font'**
  String get translationFont;

  /// Label for parallel translation font size
  ///
  /// In en, this message translates to:
  /// **'Translation font size: {size}'**
  String translationFontSizeValue(int size);

  /// Hint text for input field to add a word
  ///
  /// In en, this message translates to:
  /// **'Enter a word'**
  String get enterWordHint;

  /// Error message when logout fails
  ///
  /// In en, this message translates to:
  /// **'Logout failed'**
  String get logoutFailed;

  /// Message shown when book data cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load book data.'**
  String get bookLoadFailed;

  /// Text indicating a value is not available
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// Hard rating button text
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// Easy rating button text
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// Counter of items due for review today
  ///
  /// In en, this message translates to:
  /// **'Due today: {count}'**
  String reviewDueToday(int count);

  /// Statistics screen title
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// Button/link to open statistics
  ///
  /// In en, this message translates to:
  /// **'Show learning statistics'**
  String get showStatistics;

  /// Current learning streak in days
  ///
  /// In en, this message translates to:
  /// **'You are learning words for {days} days'**
  String studyStreakDays(int days);

  /// Record streak in days
  ///
  /// In en, this message translates to:
  /// **'Record {days} days'**
  String recordStreakDays(int days);

  /// Progress of learned new words today
  ///
  /// In en, this message translates to:
  /// **'Learned today {used}/{limit}'**
  String learnedTodayProgress(int used, int limit);

  /// Period selection label
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// 7 days period option
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get period7Days;

  /// 30 days period option
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get period30Days;

  /// 90 days period option
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get period90Days;

  /// This year period option
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get periodThisYear;

  /// All time period option
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get periodAllTime;

  /// Number of words currently being learned
  ///
  /// In en, this message translates to:
  /// **'Currently learning: {count}'**
  String activeLearningCount(int count);

  /// Number of new words being studied today
  ///
  /// In en, this message translates to:
  /// **'Studying now: {count} new words'**
  String activeNewTodayCount(int count);

  /// Total learned words
  ///
  /// In en, this message translates to:
  /// **'Total learned words: {count}'**
  String totalLearnedWords(int count);

  /// Total repeated words
  ///
  /// In en, this message translates to:
  /// **'Total repeated words: {count}'**
  String totalRepeatedWords(int count);

  /// Total already known words
  ///
  /// In en, this message translates to:
  /// **'Total already known words: {count}'**
  String totalKnownWords(int count);

  /// Chart caption
  ///
  /// In en, this message translates to:
  /// **'Days vs. words'**
  String get chartCaption;

  /// Header for selected period stats
  ///
  /// In en, this message translates to:
  /// **'For selected period'**
  String get periodStatsHeader;

  /// X-axis title for statistics chart
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get chartAxisDays;

  /// Y-axis title for statistics chart
  ///
  /// In en, this message translates to:
  /// **'Number of words'**
  String get chartAxisWords;

  /// Legend label for period bars
  ///
  /// In en, this message translates to:
  /// **'For period'**
  String get chartLegendPeriod;

  /// Legend label for cumulative line
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get chartLegendTotal;

  /// Legend label for learned words series
  ///
  /// In en, this message translates to:
  /// **'Learned'**
  String get chartLegendLearned;

  /// Legend label for repeated words series
  ///
  /// In en, this message translates to:
  /// **'Repeated'**
  String get chartLegendRepeated;

  /// Legend label for already known words series
  ///
  /// In en, this message translates to:
  /// **'Known'**
  String get chartLegendKnown;

  /// Words learned first time in the period
  ///
  /// In en, this message translates to:
  /// **'First learned: {count}'**
  String periodFirstLearnedWords(int count);

  /// Words repeated in the period
  ///
  /// In en, this message translates to:
  /// **'Repeated: {count}'**
  String periodRepeatedWords(int count);

  /// Words that became known in the period
  ///
  /// In en, this message translates to:
  /// **'Became known: {count}'**
  String periodBecameKnownWords(int count);

  /// Displayed when a search yields no results
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// Label for a word that has never been reviewed
  ///
  /// In en, this message translates to:
  /// **'New Word'**
  String get newWord;

  /// Label for a word being reviewed
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewWord;

  /// Current learning level of the word
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String wordLevel(int level);

  /// Shows when the word will be reviewed next
  ///
  /// In en, this message translates to:
  /// **'Next review: {days} {days, plural, =1{day} other{days}}'**
  String nextReviewDays(int days);

  /// Tooltip for text-to-speech button
  ///
  /// In en, this message translates to:
  /// **'Pronounce'**
  String get pronounce;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
