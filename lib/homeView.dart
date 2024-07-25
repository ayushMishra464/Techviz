import 'package:flutter/material.dart';
import 'package:techviz/appBar.dart';
import 'package:techviz/drawerWidget.dart';
import 'package:techviz/homeBody.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appbar(),
      drawer: drawer(context),
       body: homeBody(),
    );
  }
}
