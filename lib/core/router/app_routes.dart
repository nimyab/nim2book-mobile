abstract class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const myBooks = '/my-books';
  static const books = '/books';
  static const learning = '/learning';
  static const settings = '/settings';
  static const learningSession = '/learning-session';
  static const learningSessionNew = 'new';
  static const learningSessionReview = 'review';
  static const learningSessionMixed = 'mixed';
  static const book = '/book/:bookId';
  static const reading = '/reading/:bookId';
  static const addBook = '/add-book';
  static const dictionary = '/dictionary';

  static String bookPath(String bookId) => '/book/$bookId';
  static String readingPath(String bookId) => '/reading/$bookId';

  static String get learningSessionNewPath =>
      '$learningSession/$learningSessionNew';
  static String get learningSessionReviewPath =>
      '$learningSession/$learningSessionReview';
  static String get learningSessionMixedPath =>
      '$learningSession/$learningSessionMixed';
}
