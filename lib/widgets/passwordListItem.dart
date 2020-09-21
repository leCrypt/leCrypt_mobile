import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leCrypt_mobile/models/password.dart';
import 'package:leCrypt_mobile/storage/password_storage.dart';
import 'package:leCrypt_mobile/values/values.dart';

class PasswordItem extends StatefulWidget {
  final String website;
  final String username;
  final String password;
  final int index;
  PasswordItem({
    Key key,
    this.index,
    this.website,
    this.username,
    this.password,
  }) : super(key: key);
  @override
  _PasswordItemState createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {
  var websiteController;
  var userNameController;
  var passwordController;
  var _enabled = false;
  var _showPassword = false;

  @override
  void initState() {
    websiteController = TextEditingController(text: widget.website);
    userNameController = TextEditingController(text: widget.username);
    passwordController = TextEditingController(text: widget.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: Colors.white,
            icon: Icons.delete,
            onTap: () async {
              await PasswordStorage().DeletPassword(widget.index, context);
            },
          ),
        ],
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.75,
                    child: TextField(
                      controller: websiteController,
                      enabled: _enabled,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        border: outlineInputBorder,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(_enabled ? Icons.check : Icons.edit),
                    onPressed: () async {
                      setState(() {
                        _enabled = !_enabled;
                      });
                      if (!_enabled) {
                        await PasswordStorage().savePassword(
                          Pass(
                            website: websiteController.text,
                            username: userNameController.text,
                            password: passwordController.text,
                          ),
                          widget.index,
                          context,
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: userNameController,
                enabled: _enabled,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  border: outlineInputBorder,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                enabled: _enabled,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  suffix: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.toggle_on : Icons.toggle_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  border: outlineInputBorder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
