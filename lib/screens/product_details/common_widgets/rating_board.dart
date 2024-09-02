import 'package:flutter/material.dart';
import 'package:myntra_clone/myntra_export.dart';

class RatingBoard extends StatelessWidget {
  const RatingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GSHStack(
        children: [
          GSBox(
            style: GSStyle(width: 8),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSHStack(
                    children: [
                      GSText(
                          text: "4.1",
                          style: GSStyle(
                              textStyle: TextStyle(
                            letterSpacing: 0.6,
                            fontSize: 30,
                          ))),
                      GSBox(
                        style: GSStyle(width: 4),
                      ),
                      GSIcon(
                        icon: Icons.star,
                        style: GSStyle(
                            height: 30,
                            width: 30,
                            color: Color.fromARGB(255, 11, 168, 118)),
                      ),
                    ],
                  ),
                  GSBox(
                    style: GSStyle(height: 8),
                  ),
                  GSText(
                    text: "14 Verified Buyers",
                    style: GSStyle(textStyle: TextStyle(fontSize: 12)),
                  )
                ]),
          ),
          GSBox(
            style: GSStyle(width: 4),
          ),
          GSDivider(
            style: GSStyle(
              height: 80,
            ),
            orientation: GSOrientations.vertical,
          ),
          GSBox(
            style: GSStyle(width: 4),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: GSVStack(children: [
              RatingBar(
                  stars: 5,
                  numberOfReviews: 9,
                  totalReviews: 14,
                  barColor: Color.fromARGB(255, 11, 168, 118)),
              RatingBar(
                  stars: 4,
                  numberOfReviews: 1,
                  totalReviews: 14,
                  barColor: Color.fromARGB(255, 11, 168, 118)),
              RatingBar(
                  stars: 3,
                  numberOfReviews: 1,
                  totalReviews: 14,
                  barColor: Color.fromARGB(188, 15, 192, 136)),
              RatingBar(
                  stars: 2,
                  numberOfReviews: 2,
                  totalReviews: 14,
                  barColor: Color.fromARGB(255, 247, 139, 31)),
              RatingBar(
                  stars: 1,
                  numberOfReviews: 1,
                  totalReviews: 14,
                  barColor: Color.fromARGB(255, 232, 62, 0)),
            ]),
          ),
          GSBox(
            style: GSStyle(width: 8),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int stars;
  final int numberOfReviews;
  final int totalReviews;
  final Color barColor;

  const RatingBar({
    required this.stars,
    required this.numberOfReviews,
    required this.totalReviews,
    required this.barColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0),
      child: GSHStack(
        children: [
          GSText(
            text: stars.toString(),
            style: GSStyle(
              color: GSTheme.of(context).trueGray400,
              textStyle: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GSIcon(
              icon: Icons.star,
              style: GSStyle(
                height: 14,
                width: 14,
                color: GSTheme.of(context).trueGray300,
              ),
            ),
          ),
          FittedBox(
            child: GSProgress(
              value: numberOfReviews / totalReviews,
              size: GSProgressSizes.$xs,
              style: GSStyle(
                  width: 150,
                  bg: GSTheme.of(context).trueGray200,
                  color: barColor,
                  borderRadius: 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FittedBox(
              child: GSText(
                text: numberOfReviews.toString(),
                style: GSStyle(
                  color: GSTheme.of(context).trueGray600,
                  textStyle: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerReview extends StatelessWidget {
  final String? title;
  final String subTitle;
  final double value;

  const CustomerReview(
      {super.key, this.title, required this.subTitle, required this.value});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: GSText(
                  text: title!,
                  style: GSStyle(
                      color: GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(fontSize: 14)),
                ),
              )
            : GSBox(),
        GSHStack(
          children: [
            GSProgress(
              value: value,
              size: GSProgressSizes.$xs,
              style: GSStyle(
                  bg: GSTheme.of(context).trueGray200,
                  width: 150,
                  color: Color.fromARGB(255, 11, 168, 118)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FittedBox(
                child: GSText(
                  text: subTitle,
                  bold: title != null ? true : false,
                  style: GSStyle(
                      color: title != null
                          ? null
                          : GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(fontSize: 12)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
