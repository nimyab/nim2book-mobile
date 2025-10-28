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
}
