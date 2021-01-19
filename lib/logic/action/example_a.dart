import 'package:architecture_example/logic/providers.dart';
import 'package:architecture_example/logic/service/example_service.dart';
import 'package:architecture_example/logic/store/example_store.dart';

class ExampleAction {
  final ExampleService _service;
  final ExampleStore _store;

  ExampleAction(this._service, this._store);

  Future<void> fetchData({bool clearO = false}) {
    if (clearO) {
      _store.simulateFetching();
    }
    return _service.fetchData();
  }

  factory ExampleAction.of(context) {
    return ExampleAction(
      StaticProvider.of(context),
      StaticProvider.of(context),
    );
  }
}
