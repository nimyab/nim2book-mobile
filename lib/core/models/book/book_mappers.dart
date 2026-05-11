import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/book_chapter/book_chapter.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';

extension PersonalUserBookMapper on PersonalUserBook {
  Book toBook() {
    return Book(
      id: id,
      title: title,
      originalLang: originalLang,
      translatedLang: translatedLang,
      createdAt: createdAt,
      author: author,
      coverUrl: coverUrl,
      genres: genres,
      processStatus: processStatus,
      bookChapters: personalBookChapters
          ?.map(
            (chapter) => BookChapter(
              id: chapter.id,
              order: chapter.order,
              title: chapter.title,
              translatedTitle: chapter.translatedTitle,
              contentURL: chapter.contentUrl,
              createdAt: chapter.createdAt,
            ),
          )
          .toList(),
    );
  }
}
