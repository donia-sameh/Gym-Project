import 'package:flutter/material.dart';

import '../styles/defaultStyles.dart';

class CustomDropDown extends StatefulWidget {
  String dropdownName;
  String selectedValue;
  List<String> valuesList;
  double width;
  Color? color;

  CustomDropDown({
    required this.dropdownName,
    required this.selectedValue,
    required this.valuesList,
    required this.width,
    this.color,
    super.key,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.dropdownName}",
          style: tabTextStyle.copyWith(color: widget.color),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: crWhite,
            borderRadius: BorderRadius.circular(borderRadius2),
            border: Border.all(color: crWhite, width: 1),
          ),
          width: widget.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              value: widget.selectedValue,
              items: widget.valuesList.map(buildMenuItem).toList(),
              onChanged: (value) =>
                  setState(() => widget.selectedValue = value!),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: textStyle.copyWith(
            color: crBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
