import 'package:get/get.dart';

class CredentialsRepository extends GetxController {
  // final _currentTaskChannel = GrpcOrGrpcWebClientChannel.grpc(
  //   '',
  //   port: 9090,
  //   options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  // );

  T client<T>() {
    switch (T) {
      // case DiaryClient:
      //   return DiaryClient(_currentTaskChannel) as T;
    }
    throw ("Client type not found");
  }
}
