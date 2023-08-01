import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_example/src/api/get_persons_api.dart';
import 'package:simple_bloc_example/src/bloc/fetch_result.dart';
import 'package:simple_bloc_example/src/bloc/load_action.dart';
import 'package:simple_bloc_example/src/extensions/person_url_extension.dart';
import 'package:simple_bloc_example/src/model/person.dart';
import 'package:simple_bloc_example/src/model/person_url.dart';

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};

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
          final persons = await PersonApi.getPersons(url.urlString);
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
