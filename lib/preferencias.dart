import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late SharedPreferences pref;
  var a;

  Prefs()  {
    init();
  }
  init() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('key', false);
    a = pref.getBool('key');
  }

}

