import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hinText;
  final TextEditingController textCtrl;
  final IconData icon;

  const TextInputLocation(
      {Key key,
      @required this.hinText,
      @required this.textCtrl,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: textCtrl,
        style: TextStyle(
            fontSize: 15.0,
            //fontFamily: 'Lato',
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: hinText,
          suffixIcon: Icon(icon),
          fillColor: Color(0xffffffff),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffffffff),
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffffffff),
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0.0,7.0),
          ),
        ]
      ),
    );
  }
}
