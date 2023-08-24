import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  void setToken(String token) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token',token );
  }

  Future<String?> getToken() async{
    // async hai isliye future
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('x-auth-token');
    return token;
  }
}