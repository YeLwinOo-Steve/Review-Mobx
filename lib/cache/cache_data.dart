import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/review_model.dart';

const String userReviewList = 'user_reviews';
class CacheData{
  static late SharedPreferences _prefs;
  static void storeReviews(List<ReviewModel> reviews) async{
    _prefs = await SharedPreferences.getInstance();
    List<String> reviewsStrList = [];
    for(ReviewModel review in reviews){
      Map<String,dynamic> reviewStr = review.toJson();
      reviewsStrList.add(json.encode(reviewStr));
    }
    _prefs.setStringList(userReviewList, reviewsStrList);
  }

  static Future<List<ReviewModel>> getReviews() async{
    _prefs = await SharedPreferences.getInstance();
    List<ReviewModel> reviews = [];
    List<String> reviewsStrList = _prefs.getStringList(userReviewList) ?? [];
    for(String reviewStr in reviewsStrList){
      Map<String,dynamic> reviewMap = json.decode(reviewStr);
      reviews.add(ReviewModel.fromJson(reviewMap));
    }
    return reviews;
  }

}