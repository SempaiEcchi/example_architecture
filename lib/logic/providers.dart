import 'package:architecture_example/logic/observable/example_o.dart';
import 'package:architecture_example/logic/service/example_service.dart';
import 'package:architecture_example/logic/store/example_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';

List<SingleChildWidget> providers = [
  ...streams,
  ...services,
  ...stores,
  ...observables,
];

List<SingleChildWidget> streams = [
  Provider<PublishSubject<ExampleEntity>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  ),
];
List<SingleChildWidget> services = [
  Provider<ExampleService>(
    lazy: false,
    create: (context) => ExampleService(StaticProvider.of(context)),
  ),
];
List<SingleChildWidget> stores = [
  Provider<ExampleStore>(
    lazy: false,
    create: (context) => ExampleStore(StaticProvider.of(context)),
    dispose: (_, store) => store.dispose(),

  ),
];
List<SingleChildWidget> observables = [
  StreamProvider<ExampleObservable>(
    create: (context) =>
    Provider.of<ExampleStore>(context, listen: false).exampleO$,
    lazy: false,
  ),
];

class StaticProvider {
  static T of<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}
