import 'package:architecture_example/logic/observable/example_o.dart';
import 'package:architecture_example/logic/service/example_service.dart';
import 'package:rxdart/rxdart.dart';

class ExampleStore {
  final PublishSubject<ExampleEntity> exampleEntity$;

  BehaviorSubject<ExampleObservable> exampleO$ =
      BehaviorSubject.seeded(ExampleObservable.empty());

  ExampleStore(this.exampleEntity$) {
    exampleEntity$.listen((entity) {
      final value = int.tryParse(entity.value);

      exampleO$.add(ExampleObservable(value: value));
    });
  }

  void dispose() {
    exampleO$.close();
  }

  void simulateFetching() {
    exampleO$.add(null);
  }
}
