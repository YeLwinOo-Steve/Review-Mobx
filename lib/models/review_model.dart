class ReviewModel {
  final String comment;
  final int stars;
  ReviewModel({required this.comment, required this.stars});
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewModel(comment: json['comment'], stars: json['stars']);
  Map<String, dynamic> toJson() => {
        "comment": comment,
        "stars": stars,
      };
}
