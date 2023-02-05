import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/model/suggestion_model.dart';
import 'package:riverpod_tut/service/api_service.dart';

final suggestionProviderValue = FutureProvider.autoDispose.family<SuggestionModel, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion(id);
});


class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var suggestionRef = ref.watch(suggestionProviderValue('1'));

    return Scaffold(
        appBar: AppBar(title: const Text('Value Provider'),),
        body: RefreshIndicator(
          edgeOffset: 100,
          onRefresh: () => ref.refresh(suggestionProviderValue('1').future),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              children: [
                Center(
                  child: suggestionRef.when(data: (data){
                    return Text('${data.activity}');
                  }, error: (error, _){
                    return Text(error.toString());
                  }, loading: () => const CircularProgressIndicator()),
                )
              ],
            ),
          ),
        )
    );
  }
}


