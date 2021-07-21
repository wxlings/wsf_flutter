import 'package:flutter/material.dart';

class MessageFragment extends StatefulWidget {
  const MessageFragment({Key key}) : super(key: key);

  @override
  _MessageFragmentState createState() => _MessageFragmentState();
}

class _MessageFragmentState extends State<MessageFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Message fragment"),
    );
  }
}
