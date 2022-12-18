import 'package:flutter/material.dart';
import '../models/review_model.dart';
import '../widgets/info_card.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewItem;

  const ReviewWidget({Key? key, required this.reviewItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  reviewItem.comment,
                ),
              ),
              Row(
                children: List.filled(reviewItem.stars, 0, growable: false).map((listItem) {
                  return const Icon(Icons.star);
                }).toList(),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.teal,
        )
      ],
    );
  }
}