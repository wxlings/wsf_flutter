import 'package:flutter/material.dart';

class MineFragment extends StatefulWidget {
  const MineFragment({Key key}) : super(key: key);

  @override
  _MineFragmentState createState() => _MineFragmentState();
}

class _MineFragmentState extends State<MineFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Mine fragment"),
    );
  }
}
