abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final String testText;
  IncrementEvent({this.testText});
}

class DecrementEvent extends CounterEvent {}