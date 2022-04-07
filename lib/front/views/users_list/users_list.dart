import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        title: const Text('SliverAppBar'),
        backgroundColor: Colors.green,
        expandedHeight: 200.0,
        // flexibleSpace: FlexibleSpaceBar(
        //   background: Image.asset('assets/forest.jpg', fit: BoxFit.cover),
        // ),
      ),
      SliverFixedExtentList(
        itemExtent: 150.0,
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(color: Colors.red, height: 150.0);
          },
          childCount: 3,
        ),
      ),
    ]);
  }
}
