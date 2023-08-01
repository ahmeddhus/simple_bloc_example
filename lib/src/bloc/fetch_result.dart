import 'package:flutter/material.dart';
import 'package:simple_bloc_example/src/model/person.dart';

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
}
