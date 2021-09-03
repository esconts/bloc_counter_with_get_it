import 'package:bloc_counter_from_scratch/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_counter_from_scratch/dependency_injection.dart' as di;

class FirstScreen extends StatelessWidget {
  final CounterBloc? counterBloc;
  final String? title;
  final Color? color;
  FirstScreen({this.counterBloc, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    CounterBloc _blocValue = di.sl.get();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: color!,
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
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text('Push to the second screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text('Push to the third screen'),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _blocValue.add(CounterEvent.decrement);
                  },
                  child: Text('Decrement!'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _blocValue.add(CounterEvent.increment);
                  },
                  child: Text('Increment!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
