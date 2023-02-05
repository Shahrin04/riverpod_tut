import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/service/stream_service.dart';


final streamProviderValue = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamProvider);
  return streamService.getStreamValue();
});


class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var streamRef = ref.watch(streamProviderValue);
    return Scaffold(
      appBar: AppBar(title: const Text('Stream provider'),),
      body: Center(
        child: streamRef.when(data: (data){
          return Text(data.toString()) ;
        }, error: (error, _){
          return Text(error.toString());
        }, loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

