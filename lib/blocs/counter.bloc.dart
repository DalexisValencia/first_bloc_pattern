import 'dart:async';
import 'package:get_started_bloc_pattern/blocs/actions/counter.actions.dart';

class CounterBloc{
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc () {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if(event is DecrementEvent) {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
// enum CounterEvent { increment, decrement, testing }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   @override
//   int get initialState => 0;

//   @override
//   Stream<int> mapEventToState(CounterEvent event) async*{
//     switch (event) {
//       case CounterEvent.increment:
//         yield state -1;
//       break;
//       case CounterEvent.decrement:
//         yield state +1;
//       break;
//       case CounterEvent.testing:
//       print("is");
//       print(event);
//       break;
//     }
//   }
// }

// class ExamppleAuth {
//   final String infor;
//   ExamppleAuth({this.infor});
// }

// abstract class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();

//   @override
//   List<Object> get props => [];
// }