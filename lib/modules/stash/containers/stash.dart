import 'package:flutter/material.dart';
import 'package:sew_your_stash/models/fabricItem.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';
import 'package:sew_your_stash/modules/common/services/stashService.dart';
import 'package:sew_your_stash/modules/stash/components/stashDialog.dart';

class StashPage extends StatefulWidget {
  StashPage({Key key}) : super(key: key);

  @override
  _StashPageState createState() => _StashPageState();
}

class _StashPageState extends State<StashPage> {
  bool _isLoading = false;
  final _stashList = List<ListTile>();
  final _stashItemList = List<StashItem>();

  @override
  void initState() {
    super.initState();

    // fetchStash from FireBase
    _isLoading = true;
    //getStash(id)
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('My Stash', context),
      drawer: AppDrawer(),
      body: ListView(
        children: _stashList
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add to Stash!',
        child: Icon(Icons.create),
        onPressed: () {
          showDialog(
              context: context,
              child: StashDialog(
                onStashItemAdded: (StashItem item) {
                  _stashItemList.add(item);

                  //Save Fabric Item
                  updateStash(
                    "get ID from local storage", 
                    _stashItemList.map((StashItem item) {
                    return item.toJson();
                  }));
                },
              )
          );
        },
      ),
    );
  }
}
