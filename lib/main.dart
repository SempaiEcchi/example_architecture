import 'package:architecture_example/logic/action/example_a.dart';
import 'package:architecture_example/logic/observable/example_o.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/providers.dart';

void main() {
  Provider.debugCheckInvalidValueType = <T>(T value) {
    return true;
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            ExampleAction.of(context).fetchData(clearO: true);
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black,
            child: Consumer<ExampleObservable>(builder: (context, o, _) {
              if (o?.value == null) return CircularProgressIndicator();
              return Text(o.value.toString(),style: TextStyle(color: Colors.white),);
            }),
          ),
        ),
      ),
    );
  }
}
