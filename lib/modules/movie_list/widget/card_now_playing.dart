import 'package:flutter/material.dart';
import 'package:movie_application/common/style.dart';

class CardNowPlaying extends StatefulWidget {
  final String image;
  final String title;
  final String rating;
  final String? label;

  const CardNowPlaying({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    this.label,
  }) : super(key: key);

  @override
  State<CardNowPlaying> createState() => _CardNowPlayingState();
}

class _CardNowPlayingState extends State<CardNowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 150.0,
          height: 235,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                widget.image,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: neutral300,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          width: 150.0,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: myTextTheme.headline5,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          width: 150.0,
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  size: 18,
                  Icons.star,
                  color: yellow500,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.rating,
                    style: myTextTheme.caption?.copyWith(
                      color: neutral400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
