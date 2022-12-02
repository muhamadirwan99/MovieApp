import 'package:flutter/material.dart';
import 'package:movie_application/common/style.dart';

class Headline extends StatefulWidget {
  final String value;

  const Headline({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.value,
      style: myTextTheme.headline4?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
