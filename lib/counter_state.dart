part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counterValue;
  const CounterState(this.counterValue);
}

final class CounterInitial extends CounterState {

  const CounterInitial():super(0);
}

class CounterUpdated extends CounterState{
  const CounterUpdated(int value):super(value);
}
