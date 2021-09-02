import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  String? text;

  InfoPage({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFO PAGE'),
      ),
      body: Center(
        child: Text('TEXT'),
      ),
    );
  }
}
