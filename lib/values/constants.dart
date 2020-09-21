import 'package:flutter/material.dart';

final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black, width: 5),
  borderRadius: BorderRadius.circular(0),
);

final OutlineInputBorder outlineInputBorderTextField = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.black,
    width: 2,
  ),
);

final InputDecoration inputDecorationTextField = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  border: outlineInputBorder,
);

final BoxDecoration boxDecorationTextField = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Colors.black,
    width: 4,
  ),
  borderRadius: BorderRadius.circular(10),
);
