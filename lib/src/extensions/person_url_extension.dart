import 'package:simple_bloc_example/src/model/person_url.dart';

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'put here [persons1] json file API using Live server extension on VSCode';
      case PersonUrl.persons2:
        return 'put here [persons]2 json file API using Live server extension on VSCode';
    }
  }
}
