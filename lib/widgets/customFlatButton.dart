import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/values/colors.dart';

class CustomRaisedButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final double topPadding;
  final double offset;
  final double fontSize;
  final double width;

  CustomRaisedButton({
    this.onTap,
    this.title,
    this.topPadding = 16,
    this.offset = 7,
    this.fontSize = 22,
    this.width,
  });

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  Color textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: purpleAccent,
            offset: Offset(widget.offset, widget.offset),
          ),
        ],
      ),
      child: RaisedButton(
        onPressed: widget.onTap,
        elevation: 0,
        color: Colors.black,
        highlightColor: Colors.white,
        child: Text(
          widget.title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: widget.fontSize,
          ),
        ),
        padding: EdgeInsets.only(
          top: widget.topPadding,
          bottom: widget.topPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.black,
            width: 6,
          ),
        ),
        onHighlightChanged: (highlight) {
          if (highlight) {
            setState(() {
              textColor = Colors.black;
            });
          } else {
            setState(() {
              textColor = Colors.white;
            });
          }
        },
      ),
    );
  }
}
