import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }
int? counterValue = 0;

class CounterBloc extends Bloc<CounterEvent, int?> {
  CounterBloc(initialState) : super(counterValue);
  @override
  Stream<int?> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increment) {
      counterValue = counterValue! + 1;
    } else if (event == CounterEvent.decrement) {
      counterValue = counterValue! - 1;
    }
    yield counterValue;
  }
}
