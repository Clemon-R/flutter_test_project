import 'package:flutter/material.dart';
import 'package:test_project/front/views/users_list/bloc/users_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/front/views/users_list/bloc/users_list_state.dart';

import 'bloc/users_list_event.dart';
import 'components/users_card_component.dart';

// ignore: must_be_immutable
class UsersList extends StatelessWidget {
  final UsersListBloc _bloc = UsersListBloc();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController(text: "");
  bool reloaded = false;

  UsersList({Key? key}) : super(key: key) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge && reloaded) {
        _bloc.add(UserListLoadMoreEvent());
        reloaded = false;
      }
    });
    _controller.addListener(() {
      _bloc.add(UserListSearchEvent(search: _controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<UsersListBloc, UsersListState>(
        listener: (context, state) {
          if (state is UsersListDefaultState) {
            if (state.resetSearch) {
              _controller.text = "";
            }
          }
        },
        builder: (context, state) {
          if (state is UsersListDefaultState) {
            return _buildMainScreen(state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildMainScreen(UsersListDefaultState state) {
    reloaded = true;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Column(
            children: [
              Center(child: Text("Users ${state.users.users.length}")),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Recherche par nom',
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey[300],
          expandedHeight: 150.0,
          toolbarHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
                'https://png.pngtree.com/thumb_back/fh260/back_our/20190625/ourmid/pngtree-simple-flat-geometric-atmosphere-hand-close-up-user-landing-background-image_261496.jpg',
                fit: BoxFit.cover),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 130.0,
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return UsersCardComponent(user: state.users.users[index]);
            },
            childCount: state.users.users.length,
          ),
        ),
      ],
    );
  }
}
