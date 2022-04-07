import 'package:flutter/material.dart';
import 'package:test_project/front/views/users_list/components/users_card_component.dart';
import 'package:test_project/job/models/user_model.dart';

class UserDetailView extends StatelessWidget {
  final UserModel user;
  const UserDetailView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Return"),
          ),
          SizedBox(
            height: 130,
            child: UsersCardComponent(
              user: user,
              isClickable: false,
            ),
          ),
        ],
      ),
    ));
  }
}
