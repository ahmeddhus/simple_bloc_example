import 'package:flutter/material.dart';
import 'package:simple_bloc_example/src/model/person_url.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction extends LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url}) : super();
}
