import 'package:flutter/material.dart';
import 'package:portaldocliente/themes/custom_theme.dart';

import 'custom_text_util.dart';

class TileSection extends StatelessWidget {
  TileSection(this.title, this.link, this.context, this.route);

  final String title;
  final String link;
  final BuildContext context;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24, top: 10, bottom: 10, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(title, FontWeight.w600, kPrimaryColor, 24),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
              child: CustomText(link, FontWeight.w600, kOrangeColor, 16),
            ),
          ],
        ));
  }
}
