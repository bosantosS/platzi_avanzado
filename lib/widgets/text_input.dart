import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  final TextEditingController textCtrl; // Ayuda con el formulario
  int maxlines = 1;

  TextInput({
    Key key, 
    @required this.hintText, 
    @required this.inputType, 
    @required this.textCtrl,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0,left: 20.0),
      child: TextField(
        controller: textCtrl,
        keyboardType: inputType,
        maxLines: maxlines,
        style: TextStyle(
          fontSize: 15.0,
          //fontFamily: 'Lato',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffe5e5e5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffe5e5e5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
        ),
      ),
    );
  }
}