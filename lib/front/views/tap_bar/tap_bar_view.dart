import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../speedit_algo/speedit_algo_view.dart';
import '../users_list/users_list.dart';

class TapBarView extends StatelessWidget {
  const TapBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white.withAlpha(230),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                ),
              ]),
          child: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Users",
                icon: Icon(Icons.list, color: Colors.black),
              ),
              Tab(
                text: "SpeedIt",
                icon: Icon(Icons.local_shipping_sharp, color: Colors.black),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              const UsersList(),
              SpeeditAlgoView(),
            ],
          ),
        ),
      ),
    );
  }
}
