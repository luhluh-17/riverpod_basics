import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamServiceProvider = Provider<StreamService>((ref) {
  return StreamService();
});

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  }
}
