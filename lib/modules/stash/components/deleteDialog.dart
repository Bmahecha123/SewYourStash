import 'package:flutter/material.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/theme/theme.dart';

class DeleteDialog extends StatelessWidget {
  final StashItem stashItem;
  final VoidCallback onDelete;

  DeleteDialog({this.stashItem, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Stash Item", textAlign: TextAlign.center, style: headerFontStyle()),
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          children: <Widget>[
            Text("${stashItem.type}: ${stashItem.subType}", style: itemFontStyle()),
            Text(stashItem.intendedUse, style: itemFontStyle()),
            Expanded(child: Padding(
              padding: EdgeInsets.only(
                        left: 0.0, top: 15.0, right: 0.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      onDelete();
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.check,
                      color: buttonForegroundColor,
                    ),
                  ),
                  RaisedButton(
                    child: Icon(Icons.close, color: buttonForegroundColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]
              ),
            )),
            
          ],
        )
      )
    );
  }

}