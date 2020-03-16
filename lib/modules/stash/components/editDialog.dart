import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sew_your_stash/common/units.dart';
import 'package:sew_your_stash/models/fabricType.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/theme/theme.dart';

class EditDialog extends StatefulWidget {
  final Function(StashItem) onEdit;
  final StashItem stashItem;
  final List<FabricType> fabricTypes;
  final List<String> fabricSubTypes;

  EditDialog({this.onEdit, this.stashItem, this.fabricTypes, this.fabricSubTypes});

  @override
  State<StatefulWidget> createState() => _EditDialogState(
    stashItem: stashItem, onEdit: onEdit, fabricTypes: fabricTypes, fabricSubTypes: fabricSubTypes);
}

class _EditDialogState extends State<EditDialog> {
  final StashItem stashItem;
  final Function(StashItem) onEdit;
  final List<FabricType> fabricTypes;
  List<String> fabricSubTypes = [];
  final _formKey = GlobalKey<FormState>();

  _EditDialogState({this.stashItem, this.onEdit, this.fabricTypes, this.fabricSubTypes});

@override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          'Update Stash!',
          textAlign: TextAlign.center,
        ),
        content: Container(
          height: 600,
          width: 300,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Fabric Information'),
                      DropdownButtonFormField<String>(
                        value: stashItem.type,
                        hint: Text('Select Fabric Type'),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            stashItem.type = newValue;
                            stashItem.subType = null;
                            fabricSubTypes = fabricTypes
                                .firstWhere((FabricType type) =>
                                    type.type.startsWith(newValue))
                                .subTypes;
                          });
                        },
                        items: fabricTypes.map((FabricType value) {
                          return DropdownMenuItem<String>(
                              value: value.type, child: Text(value.type));
                        }).toList(),
                        validator: (value) => value == null
                            ? 'Select a fabric type.'
                            : null,
                      ),
                      Visibility(
                        visible: fabricSubTypes.isNotEmpty,
                        child: DropdownButtonFormField<String>(
                            value: stashItem.subType,
                            hint: Text('Select Fabric SubType'),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            items: fabricSubTypes.map((String subType) {
                              return DropdownMenuItem<String>(
                                  value: subType, child: Text(subType));
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                stashItem.subType = newValue;
                              });
                            }),
                      ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  initialValue: stashItem.weight.toString(),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Weight',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    stashItem.weight = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Enter weight.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: stashItem.weightUnit,
                                  items: weightUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                        stashItem.weightUnit = value;
                                      }),
                                  validator: (value) => value == null ? 'Select unit.' : null,
                              ),
                            )
                          ],
                        ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  initialValue: stashItem.width.toString(),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Width',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    stashItem.width = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Enter width.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: stashItem.widthUnit,
                                  items: measurementUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                        stashItem.widthUnit = value;
                                      }),
                                  validator: (value) => value == null ? 'Select unit.' : null,
                              ),
                            )
                          ],
                        ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  initialValue: stashItem.yardageTotal.toString(),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Yardage',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    stashItem.yardageTotal = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Enter yardage.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: stashItem.yardageUnit,
                                  items: measurementUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                    stashItem.yardageUnit = value;
                                  }),
                                  validator: (value) => value == null ? 'Select unit.' : null,
                              ),
                            )
                          ],
                        ),
                      TextFormField(
                        initialValue: stashItem.intendedUse,
                        decoration: InputDecoration(
                          labelText: 'Intended Use',
                        ),
                        onChanged: (String newValue) {
                          stashItem.intendedUse = newValue;
                        },
                      ),
                      Padding(
                          child: Text('Branding'), padding: EdgeInsets.all(5)),
                      TextFormField(
                        initialValue: stashItem.branding.brand,
                        decoration: InputDecoration(
                          labelText: 'Brand',
                        ),
                        onChanged: (String newValue) {
                          stashItem.branding.brand = newValue;
                        },
                      ),
                      TextFormField(
                        initialValue: stashItem.branding.designer,
                        decoration: InputDecoration(
                          labelText: 'Designer',
                        ),
                        onChanged: (String newValue) {
                          stashItem.branding.designer = newValue;
                        },
                      ),
                      Padding(child: Text('Tags'), padding: EdgeInsets.all(5)),
                      ...?stashItem.tags.map((tag) {
                        return ListTile(
                            title: Text(tag),
                            trailing: Icon(
                              Icons.remove,
                              color: blue,
                            ),
                            onTap: () => setState(() {
                                  stashItem.tags.remove(tag);
                                }));
                      }),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Press Enter to add Tag'),
                        onFieldSubmitted: (String tag) {
                          setState(() {
                            stashItem.tags.add(tag);
                          });
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              onEdit(stashItem);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: buttonForegroundColor,
                          ),
                        ),
                        RaisedButton(
                          child: Icon(Icons.close, color: buttonForegroundColor),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  
}