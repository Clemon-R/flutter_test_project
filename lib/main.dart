import 'package:flutter/material.dart';
import 'package:test_project/dependencies_provider.dart';

import 'front/views/tap_bar/tap_bar_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: DependenciesProvider.init(),
        initialData: false,
        builder: (context, AsyncSnapshot<bool> data) {
          if (data.hasData && data.data!) {
            return const TapBarView();
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
