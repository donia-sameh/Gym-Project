import 'package:flutter/material.dart';
import '../../../shared/styles/defaultStyles.dart';

class CoachCard extends StatefulWidget {
  String coachName;
  String img;

  double? width;
  double? height;
  CoachCard({
    required this.coachName,
    required this.img,
    this.width,
    this.height,
    super.key,
  });

  @override
  State<CoachCard> createState() => _CoachCardState();
}

class _CoachCardState extends State<CoachCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width == null ? 200 : widget.width,
            height: widget.height == null ? 200 : widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("${widget.img}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "${widget.coachName}",
                style: titleStyle.copyWith(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
