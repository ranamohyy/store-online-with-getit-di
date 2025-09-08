import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper{
  final storage = FlutterSecureStorage (
    aOptions:AndroidOptions(
    encryptedSharedPreferences: true,
  ));


 Future<String>getToken()async{
   return await storage.read(key: 'token')??"";
  }
 Future saveToken(String token)async{
   await storage.write(key: 'token', value: token);
  }
 Future deleteToken()async{
   await storage.delete(key: 'token');
  }



}