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
