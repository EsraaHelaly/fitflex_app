import 'package:fitflex_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;

  final Function onsaved;
  final Function validator;

  final IconData icon;

  final bool ispassword;

  final TextInputType keyboardtype;

  const CustomTextField({
    Key key,
    this.hinttext,
    this.onsaved,
    this.validator,
    this.icon,
    this.ispassword = false,
    this.keyboardtype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kfillColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: keyboardtype,
        obscureText: ispassword,
        onSaved: onsaved,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.black),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
