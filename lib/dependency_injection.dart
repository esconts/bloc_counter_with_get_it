import 'package:bloc_counter_from_scratch/counter_bloc.dart';
import 'package:get_it/get_it.dart';

 GetIt sl = GetIt.instance;

 void init() {
   sl.registerLazySingleton<CounterBloc>(() => CounterBloc(0));
  
 }