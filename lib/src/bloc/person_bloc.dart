import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_example/src/bloc/bloc_actions.dart';
import 'package:simple_bloc_example/src/bloc/person.dart';

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<String, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoadPersonsAction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          // we have the value in cache.
          final cachedPersons = _cache[url];
          final result = FetchResult(
            persons: cachedPersons!,
            isRetrievedFRomCache: true,
          );
          emit(result);
        } else {
          final loader = event.loader;
          final persons = await loader(url);
          _cache[url] = persons;
          final result = FetchResult(
            persons: persons,
            isRetrievedFRomCache: false,
          );
          emit(result);
        }
      },
    );
  }
}
