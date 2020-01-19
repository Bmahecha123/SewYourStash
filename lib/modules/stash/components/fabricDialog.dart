import 'package:flutter/material.dart';
import 'package:sew_your_stash/models/fabricItem.dart';

class FabricDialog extends StatefulWidget {
  final VoidCallback onStashItemAdded;

  FabricDialog({Key key, this.onStashItemAdded}) : super(key: key);

  @override
  _FabricDialogState createState() => _FabricDialogState();
}

class _FabricDialogState extends State<FabricDialog> {
  final _formKey = GlobalKey<FormState>();
  final _fabricList = List<ListTile>();
  FabricItem _fabricItem = FabricItem();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        'Add to my Stash!',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text('Fabric Information'),
                  DropdownButtonFormField<String>(
                    value: _fabricItem.type,
                    hint: Text('Select Fabric Type'),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String newValue) {
                      setState(() {
                        _fabricItem.type = newValue;
                      });
                    },
                    items: <String>['Qulting Cotton', 'Woven', 'Knit', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please select a fabric type.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Weight',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.weight = newValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Width',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.width = int.parse(newValue);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Yardage',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.yardageTotal = int.parse(newValue);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter yardage.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Intended Use',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.intendedUse = newValue;
                    },
                  ),
                  //ListTile(leading: Text('Tags'), title: TextField(), trailing: Icon(Icons.add),),
                  Text('Branding'),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Brand',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.branding.brand = newValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Designer',
                    ),
                    onFieldSubmitted: (String newValue) {
                      _fabricItem.branding.designer = newValue;
                    },
                  ),
                  ..._fabricList
                ],
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   Scaffold.of(context).showSnackBar(
                    //       SnackBar(content: Text('Processing Data')));
                    // }

                    setState(() {
                      _fabricList.add(ListTile(
                        title: Text('Testtt'),
                      ));
                    });
                  },
                  child: Text('Submit'),
                ),
                RaisedButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
