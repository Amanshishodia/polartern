import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>((event, emit) {
     emit(CounterUpdated(state.counterValue+1));
    });
    on<DecrementCounter>((event, emit) {
      emit(CounterUpdated(state.counterValue-1));
    });
  }
}
