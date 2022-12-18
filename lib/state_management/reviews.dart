import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:review_mobx/cache/cache_data.dart';

import '../models/review_model.dart';

part 'reviews.g.dart';

class Reviews = ReviewBase with _$Reviews;

abstract class ReviewBase with Store {
  @observable
  ObservableList<ReviewModel> reviews = ObservableList.of([]);

  @observable
  double averageStars = 0;

  @computed
  int get reviewsCount => reviews.length;

  int totalStars = 0;

  @action
  void addReview(ReviewModel review) {
    reviews.add(review);

    // Calc average stars
    averageStars = _calcAverageStars(review.stars);
    // Calc total stars
    totalStars += review.stars;

    // Save reviews
    CacheData.storeReviews(reviews);
  }

  @action
  Future<void> initReviews() async {
    await CacheData.getReviews().then((reviewsList) {
      reviews = ObservableList.of(reviewsList);
      for (ReviewModel review in reviewsList) {
        totalStars += review.stars;
      }
      averageStars = totalStars / reviewsCount;
    });
  }

  double _calcAverageStars(int newStars) {
    return (newStars + totalStars) / reviewsCount;
  }
}
