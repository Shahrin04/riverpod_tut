import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = Provider<StreamService>((ref) => StreamService());

class StreamService{
  Stream<int> getStreamValue(){
    return Stream.periodic(const Duration(seconds: 1), (i)=> i).take(11);
  }
}