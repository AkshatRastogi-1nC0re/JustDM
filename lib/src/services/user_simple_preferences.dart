import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyName = 'user_name';
  static const _keyPhone = 'user_phone';
  static const _keyDefaultAddress = 'user_address';
  static const _keyGender = 'user_gender';
  static const _keyInfoAvailable = 'information_available';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserName(String name) async =>
      await _preferences!.setString(_keyName, name);
  static String? getUserName() => _preferences?.getString(_keyName);

  static Future setUserPhone(String phone) async =>
      await _preferences!.setString(_keyPhone, phone);
  static String? getUserPhone() => _preferences?.getString(_keyPhone);

  static Future setUserAddress(String address) async =>
      await _preferences!.setString(_keyDefaultAddress, address);
  static String? getUserAddress() =>
      _preferences?.getString(_keyDefaultAddress);

  static Future setUserGender(String gender) async =>
      await _preferences!.setString(_keyGender, gender);
  static String? getUserGender() => _preferences?.getString(_keyGender);

  static Future setInfoAvailable(bool infoAvailable) async =>
      await _preferences!.setBool(_keyInfoAvailable, infoAvailable);
  static bool? getInfoAvailable() => _preferences?.getBool(_keyInfoAvailable);

  Future<bool> saveUserData(data) async {
    await setUserName(data['name']);
    await setUserPhone(data['mobile']);
    await setUserAddress(data['address'][0]);
    await setUserGender(data['gender']);
    await setInfoAvailable(true);
    return true;
  }

  Future<List<String>> getUserData() async {
    List<String> userData = [];
    userData.add(getUserName()!);
    userData.add(getUserPhone()!);
    userData.add(getUserAddress()!);
    userData.add(getUserGender()!);
    return userData;
  }
}
