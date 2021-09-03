import 'package:bloc_counter_from_scratch/counter_bloc.dart';
import 'package:bloc_counter_from_scratch/router/app_router.dart';
import 'package:bloc_counter_from_scratch/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterBloc _blocValue = di.sl.get();
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRouter.onGenerateRoute,
      home: BlocBuilder(
        builder: (context, state) => FirstScreen(
          title: 'FIRST SCREEN',
          color: Colors.deepPurpleAccent,
        ),
        bloc: _blocValue,
      ),
    );
  }
}
