import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:leCrypt_mobile/storage/search.dart';
import 'package:leCrypt_mobile/values/values.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  var inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<AppProvider>(context, listen: false);
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
                controller: inputController,
                cursorColor: purplePrimary,
                onChanged: (value) {
                  if (value.isEmpty) {
                    provider.setIsSearchingList(false);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
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
                      inputController.clear();
                      provider.setIsSearchingList(false);
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
                onPressed: () {
                  if (provider.pageIndex == 0) {
                    SearchList().searchNoteList(
                      inputController.text,
                      context,
                    );
                  } else {
                    SearchList().searchPassList(
                      inputController.text,
                      context,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
