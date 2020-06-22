import 'package:flutter/material.dart';
import 'package:portaldocliente/themes/custom_theme.dart';

class CustomRaisedButton extends StatelessWidget {
  final String text;
  final Function callback;
  final double width;
  final double height;

  CustomRaisedButton({
    @required this.text,
    @required this.callback,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height : 44,
      width: width != null ? width : 250,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(text,
            style: gFont(
                myTextStyle: TextStyle(color: kWhiteColor, fontSize: 16))),
        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
        textColor: Colors.white,
        onPressed: callback,
      ),
    );
  }
}
