import 'package:flutter_github_repos/app/data/models/github_repos_model.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHive {
  // hive box to store user data
  static late Box<UserModel> _userBox;
  static late Box<Items> _itemsBox;
  // box name its like table name
  static const String _userBoxName = 'user';
  static const String _itemsBoxName = 'items';
  // store current user as (key => value)
  static const String _currentUserKey = 'local_user';
  static const String _currentItemsKey = 'local_item';

  /// initialize local db (HIVE)
  static init({List<TypeAdapter>? adapters}) async {
    await Hive.initFlutter();
    adapters?.forEach((adapter) {
      Hive.registerAdapter(adapter);
    });
    await _initItemsBox();
    await _initUserBox();
  }

  /// initialize user box
  static Future<void> _initUserBox() async {
    _userBox = await Hive.openBox(_userBoxName);
  }

  static Future<void> _initItemsBox() async {
    _itemsBox = await Hive.openBox(_itemsBoxName);
  }

  /// save user to database
  static Future<void> saveUserToHive(UserModel user) async {
    try {
      await _userBox.put(_currentUserKey, user);
    } catch (error) {
      Logger().e('Hive Error => $error');
    }
  }

  static Future<void> saveItemsToHive(Items items) async {
    try {
      await _itemsBox.put(_currentItemsKey, items);
    } catch (error) {
      Logger().e("Hive Error => $error");
    }
  }

  /// get current logged user
  static UserModel? getCurrentUser() {
    try {
      return _userBox.get(_currentUserKey);
    } catch (error) {
      return null;
    }
  }

  static Items? getItems() {
    try {
      return _itemsBox.get(_currentItemsKey);
    } catch (error) {
      return null;
    }
  }

  static Future<void> deleteCurrentUser() async {
    try {
      await _userBox.delete(_currentUserKey);
    } catch (error) {
      return;
    }
  }
}
