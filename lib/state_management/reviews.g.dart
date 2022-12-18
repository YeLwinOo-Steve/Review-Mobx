// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Reviews on ReviewBase, Store {
  Computed<int>? _$reviewsCountComputed;

  @override
  int get reviewsCount =>
      (_$reviewsCountComputed ??= Computed<int>(() => super.reviewsCount,
              name: 'ReviewBase.reviewsCount'))
          .value;

  late final _$reviewsAtom = Atom(name: 'ReviewBase.reviews', context: context);

  @override
  ObservableList<ReviewModel> get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(ObservableList<ReviewModel> value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
    });
  }

  late final _$averageStarsAtom =
      Atom(name: 'ReviewBase.averageStars', context: context);

  @override
  double get averageStars {
    _$averageStarsAtom.reportRead();
    return super.averageStars;
  }

  @override
  set averageStars(double value) {
    _$averageStarsAtom.reportWrite(value, super.averageStars, () {
      super.averageStars = value;
    });
  }

  late final _$initReviewsAsyncAction =
      AsyncAction('ReviewBase.initReviews', context: context);

  @override
  Future<void> initReviews() {
    return _$initReviewsAsyncAction.run(() => super.initReviews());
  }

  late final _$ReviewBaseActionController =
      ActionController(name: 'ReviewBase', context: context);

  @override
  void addReview(ReviewModel review) {
    final _$actionInfo =
        _$ReviewBaseActionController.startAction(name: 'ReviewBase.addReview');
    try {
      return super.addReview(review);
    } finally {
      _$ReviewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reviews: ${reviews},
averageStars: ${averageStars},
reviewsCount: ${reviewsCount}
    ''';
  }
}
