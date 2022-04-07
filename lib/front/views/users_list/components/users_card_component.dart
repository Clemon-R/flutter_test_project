import 'package:flutter/material.dart';
import 'package:test_project/front/constants/text_styles.dart';
import 'package:test_project/front/views/user_detail/user_detail_view.dart';
import 'package:test_project/job/models/user_model.dart';

class UsersCardComponent extends StatelessWidget {
  final UserModel user;
  final bool isClickable;

  const UsersCardComponent(
      {Key? key, required this.user, required this.isClickable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isClickable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserDetailView(user: user)),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.grey[250],
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            child: Image(
              image: NetworkImage(user.picture.toString()),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: TextStyles.sectionTitle,
                ),
                Text(user.gender),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
