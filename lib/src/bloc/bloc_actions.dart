import 'package:flutter/foundation.dart' show immutable;
import 'package:simple_bloc_example/src/bloc/person.dart';
import 'package:simple_bloc_example/src/extensions/iterable_extension.dart';

const person1Url = 'put here [persons]1 json file API using [Live server] extension on VSCode';
const person2Url = 'put here [persons]2 json file API using [Live server] extension on VSCode';

typedef PersonLoader = Future<Iterable<Person>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction extends LoadAction {
  final String url;
  final PersonLoader loader;

  const LoadPersonsAction({
    required this.url,
    required this.loader,
  }) : super();
}

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrievedFRomCache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFRomCache,
  });

  @override
  String toString() =>
      'FetchResult (isRetrievedFromCache = $isRetrievedFRomCache, persons = $persons)';

  @override
  bool operator ==(covariant FetchResult other) =>
      persons.isEqualTIgnoringOrdering(other.persons) &&
      isRetrievedFRomCache == other.isRetrievedFRomCache;

  @override
  int get hashCode => Object.hash(persons, isRetrievedFRomCache);
}
