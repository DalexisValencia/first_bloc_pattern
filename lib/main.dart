import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_bloc_pattern/blocs/actions/counter.actions.dart';
import 'package:get_started_bloc_pattern/blocs/counter.bloc.dart';
import 'package:get_started_bloc_pattern/blocs/forms/actions.forms.dart';
import 'package:get_started_bloc_pattern/blocs/forms/bloc.forms.dart';

void main() => runApp(MyApp());
// final CounterBloc myCounterBloc = BlocProvider.of<CounterBloc>(context);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider<CounterBloc>(
      //   create: (context) => CounterBloc(),
      //   child: CounterPage(),
      // ),
      // home: CounterPage(),
      home: ScaffoldBody(),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBloc(),
    );
  }
}

class FormBloc extends StatefulWidget {
  @override
  _FormBlocState createState() => _FormBlocState();
}

class _FormBlocState extends State<FormBloc> {
 final _bloc = FomrBloc(); 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (val){
                _bloc.renamedEventSink.add(SetName(name: val));
              },
              decoration: InputDecoration(
                hintText: 'Ingresa tu nombre',
              ),
            ),
            TextFormField(
              onChanged: (val){
                _bloc.renamedEventSink.add(SetEmail(email: val ));
              },
              decoration: InputDecoration(
                hintText: 'Ingresa tu email'
              ),
            ),
            RaisedButton(
              onPressed: (){
               print(_bloc.name);
               print(_bloc.email);
              },
              child: Text('Muestra los datos'),
            ),
            // StreamBuilder(
            //   stream: _bloc.completeName,
            //   initialData: 0,
            //   builder: (BuildContext context, AsyncSnapshot snapshot){
            //     return Text('${_bloc.name}');
            //   },
            // ),
            // StreamBuilder(
            //   stream: _bloc.fullMail,
            //   initialData: 0,
            //   builder: (BuildContext context, AsyncSnapshot snapshot){
            //     return Text('${_bloc.email}');
            //   },
            // )
          ],
        )
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = CounterBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('counter'),
      ),
      body: StreamBuilder(
        stream: _bloc.counter,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          return Center(
            child: Text(
              '${snapshot.data}'
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.supervised_user_circle),
              onPressed: () {
                _bloc.counterEventSink.add(IncrementEvent(testText: 'example'));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _bloc.counterEventSink.add(DecrementEvent());
              },
            ),
          )
        ],
      ),
    );
  }
}
