import 'package:bloc_counter_from_scratch/counter_bloc.dart';
import 'package:bloc_counter_from_scratch/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'dependency_injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(counterValue),
        child: MyHomePage(
          di.sl.get(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CounterBloc counterBloc;

  MyHomePage(this.counterBloc);

  @override
  Widget build(BuildContext context) {
    CounterBloc _blocValue = di.sl.get();
    return Scaffold(
      appBar: AppBar(
        title: Text('COUNTER BLOC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int?>(
              bloc: _blocValue,
              builder: (context, state) => Text(
                state!.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('SEND TO NEXT PAGE'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _blocValue.add(CounterEvent.decrement);
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _blocValue.add(CounterEvent.increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
