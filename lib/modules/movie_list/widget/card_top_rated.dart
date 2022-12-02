import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_application/common/style.dart';
import 'package:intl/date_symbol_data_local.dart';

class CardTopRated extends StatefulWidget {
  final String image;
  final String title;
  final String rating;
  final String popular;
  final DateTime date;
  final Function() onChanged;
  final String? label;

  const CardTopRated({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.popular,
    required this.date,
    required this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  State<CardTopRated> createState() => _CardTopRatedState();
}

class _CardTopRatedState extends State<CardTopRated> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
    timeFormat = DateFormat.Hms('id');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged,
      child: SizedBox(
        height: 135.0,
        child: Row(
          children: [
            Container(
              width: 100.0,
              decoration: BoxDecoration(
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
              width: 15.0,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: myTextTheme.headline5,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
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
                    SizedBox(
                      height: 20.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            size: 18,
                            Icons.hotel_class,
                            color: red300,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.popular,
                              style: myTextTheme.caption?.copyWith(
                                color: neutral400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            size: 18,
                            Icons.date_range_rounded,
                            color: blue300,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dateFormat.format(widget.date),
                              style: myTextTheme.caption?.copyWith(
                                color: neutral400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
