import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sew_your_stash/common/units.dart';
import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/fabricType.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/theme/theme.dart';
import 'package:flutter/services.dart'
    show TextInputFormatter, WhitelistingTextInputFormatter, rootBundle;

class StashDialog extends StatefulWidget {
  final Function(StashItem) onStashItemAdded;

  StashDialog({this.onStashItemAdded});

  @override
  _StashDialogState createState() =>
      _StashDialogState(onStashItemAdded: onStashItemAdded);
}

class _StashDialogState extends State<StashDialog> {
  final _formKey = GlobalKey<FormState>();
  List<FabricType> fabricTypes = [];
  final StashItem _stashItem = StashItem(
      type: null,
      subType: null,
      weight: null,
      yardageTotal: null,
      branding: Branding(brand: "", designer: ""),
      tags: []);
  List<String> _fabricSubTypes = [];
  String _widthUnit = 'in';

  final Function(StashItem) onStashItemAdded;

  _StashDialogState({this.onStashItemAdded});

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/fabricTypes.json').then((jsonString) {
      final jsonResponse = json.decode(jsonString);

      List<dynamic> fabricTypeMap = List.from(jsonResponse);

      setState(() {
        fabricTypes = fabricTypeMap
            .map((dynamic fabricType) => FabricType.fromJson(fabricType))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Text(
          'Add to my Stash!',
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
                        value: _stashItem.type,
                        hint: Text('Select Fabric Type'),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            _stashItem.type = newValue;
                            _stashItem.subType = null;
                            _fabricSubTypes = fabricTypes
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
                            ? 'Please select a fabric type.'
                            : null,
                      ),
                      Visibility(
                        visible: _fabricSubTypes.isNotEmpty,
                        child: DropdownButtonFormField<String>(
                            value: _stashItem.subType,
                            hint: Text('Select Fabric SubType'),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            items: _fabricSubTypes.map((String subType) {
                              return DropdownMenuItem<String>(
                                  value: subType, child: Text(subType));
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                _stashItem.subType = newValue;
                              });
                            }),
                      ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 3,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Weight',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    _stashItem.weight = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Please enter weight.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: _stashItem.weightUnit,
                                  items: measurementUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                        _stashItem.weightUnit = value;
                                      }),
                                  validator: (value) => value == null ? 'Please select a unit.' : null,
                              ),
                            )
                          ],
                        ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 3,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Width',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    _stashItem.width = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Please enter width.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: _stashItem.widthUnit,
                                  items: measurementUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                        _stashItem.widthUnit = value;
                                      }),
                                  validator: (value) => value == null ? 'Please select a unit.' : null,
                              ),
                            )
                          ],
                        ),
                      Row(
                          children: <Widget>[
                            Flexible(
                                flex: 3,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Yardage',
                                    contentPadding: EdgeInsets.all(0.0),
                                  ),
                                  onChanged: (String newValue) {
                                    _stashItem.yardageTotal = int.parse(newValue);
                                  },
                                  validator: (value) => value.isEmpty ? 'Please enter yardage.' : null,
                                )),
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0)
                                ),
                                  value: _stashItem.yardageUnit,
                                  items: measurementUnits
                                      .map((String unit) =>
                                          DropdownMenuItem<String>(
                                              value: unit, child: Text(unit)))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                    _stashItem.yardageUnit = value;
                                  }),
                                  validator: (value) => value == null ? 'Please select a unit.' : null,
                              ),
                            )
                          ],
                        ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Intended Use',
                        ),
                        onChanged: (String newValue) {
                          _stashItem.intendedUse = newValue;
                        },
                      ),
                      Padding(
                          child: Text('Branding'), padding: EdgeInsets.all(5)),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Brand',
                        ),
                        onChanged: (String newValue) {
                          _stashItem.branding.brand = newValue;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Designer',
                        ),
                        onChanged: (String newValue) {
                          _stashItem.branding.designer = newValue;
                        },
                      ),
                      Padding(child: Text('Tags'), padding: EdgeInsets.all(5)),
                      ...?_stashItem.tags.map((tag) {
                        return ListTile(
                            title: Text(tag),
                            trailing: Icon(
                              Icons.remove,
                              color: blue,
                            ),
                            onTap: () => setState(() {
                                  _stashItem.tags.remove(tag);
                                }));
                      }),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Press Enter to add Tag'),
                        onFieldSubmitted: (String tag) {
                          setState(() {
                            _stashItem.tags.add(tag);
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
                              onStashItemAdded(_stashItem);
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: lightBlue,
                          ),
                        ),
                        RaisedButton(
                          child: Icon(Icons.close, color: lightBlue),
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
