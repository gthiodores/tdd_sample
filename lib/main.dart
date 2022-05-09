import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_sample/bloc/username_bloc.dart';
import 'package:tdd_sample/username_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UsernameBloc>(
        create: (context) => UsernameBloc(UsernameValidator()),
        child: const MyHomePage(title: 'Test title'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UsernameBloc, UsernameState>(
              builder: (context, state) {
                if (state is UsernameHasContentState) {
                  return Text(
                      "${state.username} is valid: ${state.correctFormat}");
                } else {
                  return Text('no content');
                }
              },
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextFormField(
              onChanged: (text) {
                context.read<UsernameBloc>().add(UsernameChangedEvent(text));
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UsernameBloc>().add(UsernameClearEvent());
              },
              child: Text("Clear"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
