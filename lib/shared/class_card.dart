import 'package:flutter/material.dart';
import '../../../shared/styles/defaultStyles.dart';

class ClassCard extends StatefulWidget {
  int calories;
  int duration;
  String className;
  String img;
  int level;
  double? width;
  double? height;
  ClassCard({
    required this.className,
    required this.calories,
    required this.duration,
    required this.img,
    required this.level,
    this.width,
    this.height,
    super.key,
  });

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width == null ? 150 : widget.width,
            height: widget.height == null ? 150 : widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("${widget.img}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "${widget.className}",
                style: titleStyle.copyWith(fontSize: 18),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Level:",
                      style: titleStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " ${widget.level}",
                      style: titleStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2002),
                lastDate: DateTime(2100),
              );
              /* If "Cancel" => null */
              if (newDate == null) return;
              /* if 'OK' => DateTime */
              setState(() => date = newDate);
              // print(date);
            },
            child: Ink(
              width: 140,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius2),
                border: Border.all(color: crWhite, width: 1),
              ),
              child: Text(
                "${date.year}/${date.month}/${date.day}",
                style: textStyle.copyWith(color: crWhite),
              ),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.calories} cal ",
                  style: titleStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "•",
                  style: titleStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " ${widget.duration} minutes",
                  style: titleStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
