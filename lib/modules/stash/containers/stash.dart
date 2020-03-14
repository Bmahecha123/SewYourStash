import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sew_your_stash/common/keys.dart';
import 'package:sew_your_stash/models/fabricItem.dart';
import 'package:sew_your_stash/models/fabricType.dart';
import 'package:sew_your_stash/models/stash.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';
import 'package:sew_your_stash/modules/common/services/local_storage.dart';
import 'package:sew_your_stash/modules/common/services/stashService.dart';
import 'package:sew_your_stash/modules/stash/components/deleteDialog.dart';
import 'package:sew_your_stash/modules/stash/components/editDialog.dart';
import 'package:sew_your_stash/modules/stash/components/stashDialog.dart';
import 'package:sew_your_stash/modules/stash/components/statelessStashDialog.dart';
import 'package:sew_your_stash/theme/theme.dart';

class StashPage extends StatefulWidget {
  StashPage({Key key}) : super(key: key);

  @override
  _StashPageState createState() => _StashPageState();
}

class _StashPageState extends State<StashPage> {
  bool _isLoading = false;
  Stash _stash = Stash(stashItems: []);
  final _stashList = List<ListTile>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<FabricType> _fabricTypes = [];
  String _photoUrl;
  String _displayName;
  String _email;

  @override
  void initState() {
    super.initState();

    fetchStash();
    loadFabricTypes();

    getValFromLocalStorage(photoUrl).then((url) {
      setState(() {
        _photoUrl = url;
      });
    });
    getValFromLocalStorage(displayName).then((displayName) {
      setState(() {
        _displayName = displayName;
      });
    });
    getValFromLocalStorage(email).then((email) {
      setState(() {
        _email = email;
      });
    });
  }

  Future<String> loadFabricTypes() {
    return rootBundle.loadString('assets/fabricTypes.json').then((jsonString) {
      final jsonResponse = json.decode(jsonString);

      List<dynamic> fabricTypeMap = List.from(jsonResponse);

      setState(() {
        _fabricTypes = fabricTypeMap
            .map((dynamic fabricType) => FabricType.fromJson(fabricType))
            .toList();
      });
    });
  }

  Future<dynamic> fetchStash() {
    _isLoading = true;

    return getValFromLocalStorage(googleId)
        .then((String id) => getStash(id).then((DocumentSnapshot snapshot) {
              try {
                setState(() {
                  _stash = Stash.fromSnapshot(snapshot);
                  _isLoading = false;
                });
              } catch (ex) {
                setState(() {
                  _isLoading = false;
                });
              }
            }));
  }

  Widget _buildStash() {
    return RefreshIndicator(
        onRefresh: () => fetchStash(),
        key: _refreshIndicatorKey,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                listTileTheme(
                  context,
                  ListTile(
                    title: Text(
                        "${_stash.stashItems[index].type}: ${_stash.stashItems[index].subType}"),
                    subtitle: Text(_stash.stashItems[index].intendedUse),
                    trailing: Text(
                        "${_stash.stashItems[index].yardageTotal} ${_stash.stashItems[index].yardageUnit}"),
                    onTap: () {
                      showDialog(
                        context: context,
                        child: StatelessStashDialog(
                          stashItem: _stash.stashItems[index],
                          onEditClicked: () {
                            showDialog(
                              context: context,
                              child: EditDialog(
                                stashItem: _stash.stashItems[index],
                                fabricTypes: _fabricTypes,
                                fabricSubTypes: _fabricTypes
                                  .firstWhere((FabricType type) => type.type.startsWith(_stash.stashItems[index].type))
                                  .subTypes,
                                onEdit: (stashItem) {
                                  _stash.stashItems.remove(_stash.stashItems[index]);
                                  _stash.stashItems.add(stashItem);
                                  updateStash(_stash.documentID, _stash.stashItems.map((item) => item.toJson())
                                    .toList()).then((result) => fetchStash());
                                },
                              ));
                          },
                      ));
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        child: DeleteDialog(
                          stashItem: _stash.stashItems[index],
                          onDelete: () {
                            _stash.stashItems.remove(_stash.stashItems[index]);
                            updateStash(_stash.documentID, _stash.stashItems.map((item) => item.toJson())
                              .toList()).then((result) => fetchStash());
                          },
                        )
                      );
                    },
                  ),
                ),
              ],
            );
          },
          itemCount: _stash.stashItems.length,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('My Stash', context),
      drawer: AppDrawer(
        profileUrl: _photoUrl, 
        displayName: _displayName, 
        displayEmail: _email,),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildStash(),
      //body: ListView(children: _stashList),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add to Stash!',
        child: Icon(Icons.create),
        onPressed: () {
          showDialog(
              context: context,
              child: StashDialog(
                fabricTypes: _fabricTypes,
                onStashItemAdded: (StashItem item) {
                  _stash.stashItems.add(item);

                  //Save Fabric Item
                  updateStash(
                          _stash.documentID,
                          _stash.stashItems
                              .map((item) => item.toJson())
                              .toList())
                      .then((onValue) => fetchStash());
                },
              ));
        },
      ),
    );
  }
}
