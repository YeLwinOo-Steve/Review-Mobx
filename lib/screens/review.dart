import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:review_mobx/models/review_model.dart';
import 'package:review_mobx/widgets/review_widget.dart';

import '../state_management/reviews.dart';
import '../widgets/info_card.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final Reviews _reviewMobx = Reviews();
  final List<int> _stars = [1, 2, 3, 4, 5];
  final TextEditingController _commentController = TextEditingController();
  int? _selectedStar;

  @override
  void initState() {
    _reviewMobx.initReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.6,
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write a review",
                      labelText: "Write a review",
                    ),
                  ),
                ),
                DropdownButton(
                  hint: const Text("Stars"),
                  elevation: 0,
                  value: _selectedStar,
                  items: _stars.map((star) {
                    return DropdownMenuItem<int>(
                      value: star,
                      child: Text(star.toString()),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      _selectedStar = item!;
                    });
                  },
                ),
                Container(
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () {
                          if (_selectedStar == null) {
                            const SnackBar snackBar = SnackBar(
                              content: Text('Select rating star ⭐'),
                              duration: Duration(milliseconds: 600),
                              dismissDirection: DismissDirection.horizontal,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (_commentController.text.isEmpty) {
                            const SnackBar snackBar = SnackBar(
                              content: Text('Review must not be empty!'),
                              duration: Duration(milliseconds: 600),
                              dismissDirection: DismissDirection.horizontal,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final ReviewModel review = ReviewModel(
                              comment: _commentController.text.trim(),
                              stars: _selectedStar!,
                            );
                            _reviewMobx.addReview(review);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            //contains average stars and total reviews card
            Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoCard(
                      infoValue: '${_reviewMobx.reviewsCount}',
                      infoLabel: "reviews",
                      cardColor: Colors.teal,
                      iconData: Icons.comment),
                  InfoCard(
                    infoValue: _reviewMobx.averageStars.toStringAsFixed(2),
                    infoLabel: "average stars",
                    cardColor: Colors.amber.shade500,
                    iconData: Icons.star,
                    key: const Key('avgStar'),
                  ),
                ],
              );
            }),
            const SizedBox(height: 24.0),
            //the review menu label
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.comment),
                  SizedBox(width: 10.0),
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            //contains list of reviews
            Expanded(
              child: Observer(
                builder: (_) {
                  if (_reviewMobx.reviews.isEmpty) {
                    return const Text("No reviews yet");
                  } else {
                    return ListView(
                      children: _reviewMobx.reviews
                          .map((review) => ReviewWidget(reviewItem: review))
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
