import 'package:flutter/material.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/theme/theme.dart';

class StatelessStashDialog extends StatelessWidget {
  final StashItem stashItem;
  final VoidCallback onEditClicked;

  StatelessStashDialog({this.stashItem, this.onEditClicked});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        RaisedButton(
          child: Icon(Icons.close, color: buttonForegroundColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Icon(Icons.edit, color: buttonForegroundColor),
          onPressed: () {
            Navigator.of(context).pop();
            onEditClicked();
          },
        ),
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(stashItem.intendedUse,
          textAlign: TextAlign.center, style: headerFontStyle()),
      content: Container(
        height: 275,
        width: 300,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Fabric Information", style: headerFontStyle()),
            Text("Type: ${stashItem.type}", style: itemFontStyle()),
            Text("Sub-Type: ${stashItem.subType}", style: itemFontStyle()),
            Text("Brand: ${stashItem.branding.brand}", style: itemFontStyle()),
            Text("Designer: ${stashItem.branding.designer}",
                style: itemFontStyle()),
            Text("Tags", style: headerFontStyle()),
            ...?stashItem.tags.map((tag) => Text(tag, style: itemFontStyle())),
            Text("Metrics", style: headerFontStyle()),
            Text("Weight: ${stashItem.weight} ${stashItem.weightUnit}",
                style: itemFontStyle()),
            Text("Width: ${stashItem.width} ${stashItem.widthUnit}",
                style: itemFontStyle()),
            Text("Yardage: ${stashItem.yardageTotal} ${stashItem.yardageUnit}",
                style: itemFontStyle()),
          ],
        )),
      ),
    );
  }
}
