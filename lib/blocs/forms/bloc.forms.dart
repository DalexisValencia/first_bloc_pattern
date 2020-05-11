// import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:get_started_bloc_pattern/blocs/forms/actions.forms.dart';

class FomrBloc{
  String name = '';
  final _nameStateController = StreamController<String>();
  StreamSink<String> get _byName => _nameStateController.sink;
  Stream<String> get completeName => _nameStateController.stream;

  final _nameEventControler = StreamController<FormsEvents>();
  Sink<FormsEvents> get renamedEventSink => _nameEventControler.sink;

  String email = '';
  final _emailStateController = StreamController<String>();
  StreamSink<String> get setEmail => _emailStateController.sink;
  Stream<String> get fullMail => _emailStateController.stream;

  final _emailEventController = StreamController<FormsEvents>();
  Sink<FormsEvents> get emailEventSink => _emailEventController.sink;

  FomrBloc() {
    _nameEventControler.stream.listen(_mapEventToState);
    _emailEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(FormsEvents event){
    if (event is SetName) {
      name = event.name;
    }

    if (event is SetEmail){
      email = event.email;
    }
    _byName.add(name);
    setEmail.add(email);
  }

  void dispose(){
    _nameStateController.close();
    _nameEventControler.close();
    _emailStateController.close();
    _emailEventController.close();
  }
}