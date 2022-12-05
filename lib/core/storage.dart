import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  final box = GetStorage();
  String userKey = "Users";
  String tokenKey = "token";
  String firsttimeKey = "FirstTime";
  String tokendurationKey = "TokenRefreshDurationKey";
  String cardDetail = "Card Details List";

  // void saveUser(User? user) {
  //   if (user == null) {
  //     box.write(userKey, null);
  //     return;
  //   }
  //   box.write(userKey, jsonEncode(user.toJson()));
  // }

  // User? getUser() {
  //   String? userString = box.read(userKey);
  //   if (kDebugMode) {
  //     print("user storage string is $userString");
  //   }
  //   if (userString != null) {
  //     var userjson = jsonDecode(userString);
  //     final user = User.fromJson(userjson);
  //     return user;
  //   }
  //   return null;
  // }

  void saveToken(String token) {
    box.write(tokenKey, token);
  }

  String getToken() {
    return box.read(tokenKey);
  }

  void saveFirstTime(bool value) {
    box.write(firsttimeKey, value);
  }

  bool getFirstTime() {
    return box.read(firsttimeKey) ?? true;
  }

  void saveTokenDuration(DateTime dateTime) {
    box.write(tokendurationKey, dateTime.toIso8601String());
  }

  DateTime getTokenDuration() {
    final result = box.read(tokendurationKey);
    if (kDebugMode) {
      print("token duration string $result");
    }
    if (result != null) {
      return DateTime.parse(result);
    }
    return DateTime.now();
  }

  // void saveCard(CreditCard creditCard) {
  //   final previousList = getAllSavedCreditCard();
  //   previousList.add(creditCard);
  //   final toJson = previousList.map((e) => e.toJson()).toList();
  //   final toString = jsonEncode(toJson);
  //   box.write(cardDetail, toString);
  // }

  // List<CreditCard> getAllSavedCreditCard() {
  //   List<CreditCard> _mycreditCard = [];
  //   String? result = box.read(cardDetail);
  //   if (result == null) {
  //     return _mycreditCard;
  //   }
  //   final json = jsonDecode(result);
  //   final list = List.from(json).map((e) => CreditCard.fromJson(e)).toList();
  //   _mycreditCard = list;
  //   return _mycreditCard;
  // }
}
