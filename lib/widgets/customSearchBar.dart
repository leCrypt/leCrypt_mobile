import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/values/values.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String hint;

  CustomSearchBar({
    this.controller,
    this.onTap,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.025, 0, size.width * 0.04, 0),
      child: Container(
        width: size.width * 0.95,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: purpleAccent,
              offset: Offset(7, 7),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.785,
              child: TextField(
                controller: controller,
                cursorColor: purplePrimary,
                onChanged: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hint,
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  focusedErrorBorder: outlineInputBorder,
                  border: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.14,
              color: Colors.black,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
