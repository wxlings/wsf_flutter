import 'package:flutter/material.dart';

class OrderListFragment extends StatefulWidget {
  const OrderListFragment({Key key}) : super(key: key);

  @override
  _OrderListFragmentState createState() => _OrderListFragmentState();
}

class _OrderListFragmentState extends State<OrderListFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("OrderList fragment"),
    );
  }
}
