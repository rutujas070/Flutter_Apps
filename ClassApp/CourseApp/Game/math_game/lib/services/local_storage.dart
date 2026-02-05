import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String highScoreKey = "highScore";
  static const String lastScoreKey = "lastScore";


  //// method for save highst score
  Future saveHighScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(highScoreKey, score);
  }

  //// method for get saved highst score
  Future getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(highScoreKey) ?? 0;
  }

  //// method for save last score
  Future saveLastScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(lastScoreKey, score);
  }

  //// method for get saved last score
  Future getLastScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(lastScoreKey) ?? 0;
  }

  //// method for reset highst score
  Future resetHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(highScoreKey, 0);
  }

  //// method for reset last score
  Future resetLastScore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(lastScoreKey, 0);
  }
}
