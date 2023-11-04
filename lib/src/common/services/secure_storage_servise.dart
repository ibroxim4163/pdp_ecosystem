

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorage {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final String accessKey = "access";
  final String refreshKey = "refresh";

  void writeToken(String token)async{
    await storage.write(key: accessKey, value: token);
  }
  void writeRefresh(String refresh)async{
    await storage.write(key: refreshKey, value: refresh);
  }

  Future<String?> getAccess() async {
    return await storage.read(key: accessKey);
  }

   Future<String?> getRefresh() async {
    return await storage.read(key: refreshKey);
  }

}
