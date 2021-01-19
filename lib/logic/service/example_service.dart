import 'dart:math';

import 'package:rxdart/rxdart.dart';

class ExampleService {
  final PublishSubject<ExampleEntity> exampleEntity$;

  ExampleService(this.exampleEntity$) {
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    final value = Random().nextInt(9999).toString();
    exampleEntity$.add(ExampleEntity(value));
  }
}

class ExampleEntity {
  final String value;

  ExampleEntity(this.value);
}
