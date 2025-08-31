import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  late SharedPreferences prefs;
  // armazena minhas preferencias dentro de uma variavel do objeto
  Map<String, bool> settings = {};

  AppPrefs(){
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
  }

  Future<void> _startPreferences() async {
    prefs = await SharedPreferences.getInstance();
    readFirst();
    //await prefs.setBool('first', true);

  }

  // metodos para ser usados em outras implemtacoes
  readFirst(){
    final first = prefs.getBool('first') ?? true;
    settings = {
      'first' : first,
    };
  }

  setFist (String first, bool yes) async{
    await prefs.setBool(first, yes);
    //readFirst();
  }

}

