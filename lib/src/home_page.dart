import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_example/src/bloc/fetch_result.dart';
import 'package:simple_bloc_example/src/bloc/load_action.dart';
import 'package:simple_bloc_example/src/bloc/person_bloc.dart';
import 'package:simple_bloc_example/src/extensions/iterable_extension.dart';
import 'package:simple_bloc_example/src/extensions/log_extension.dart';
import 'package:simple_bloc_example/src/model/person_url.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: PersonUrl.persons1,
                        ),
                      ),
                  child: const Text('Load json #1'),
                ),
                TextButton(
                  onPressed: () => context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: PersonUrl.persons2,
                        ),
                      ),
                  child: const Text('Load json #2'),
                ),
              ],
            ),
            BlocBuilder<PersonsBloc, FetchResult?>(
              buildWhen: (previousResult, currentResult) {
                return previousResult?.persons != currentResult?.persons;
              },
              builder: (context, fetchResult) {
                final persons = fetchResult?.persons;
                if (persons == null) {
                  return const SizedBox();
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      fetchResult?.log();
                      final person = persons[index]!;
                      return ListTile(
                        title: Text('${person.name}, ${person.age}'),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
