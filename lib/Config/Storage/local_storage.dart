// import 'package:shared_preferences/shared_preferences.dart';

// class LocalStorage {
//   static const _tokenKey = 'auth_token';
//   static const _caretakerIdKey = 'caretaker_id';
//   // static const _progressKey = 'user_progress';

//   /// SAVE TOKEN
//   static Future<void> saveToken(String token) async {
//     if (token.isEmpty) {
//       throw Exception('Trying to save empty token');
//     }
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }

//   /// GET TOKEN
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }

//   /// SAVE CARETAKER ID
//   static Future<void> saveCaretakerId(String id) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_caretakerIdKey, id);
//   }

//   /// GET CARETAKER ID
//   // static Future<String?> getCaretakerId() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString(_caretakerIdKey);
//   // }

//   /// GET USER PROGRESS

//   // static Future<void> saveProgress(String progress) async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   await prefs.setString(_progressKey, progress);
//   // }

//   // static Future<String?> getProgress() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString(_progressKey);
//   // }

//   /// CLEAR ALL
//   // static Future<void> clearAll() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   await prefs.clear();
//   // }
// }
