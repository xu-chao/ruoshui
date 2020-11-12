import 'package:xuchao/config/storage_manager.dart';
import 'package:xuchao/provider/view_state_model.dart';
import 'package:xuchao/services/ruoshui_repository.dart';

import 'user_model.dart';

const String kLoginName = 'kLoginName';

class LoginModel extends ViewStateModel {
  final UserModel userModel;

  LoginModel(this.userModel) : assert(userModel != null);

  String getLoginName() {
    return StorageManager.sharedPreferences.getString(kLoginName);
  }

  Future<bool> login(loginName, password) async {
    setBusy();
    try {
      var user = await RuoshuiRepository.login(loginName, password);
      userModel.saveUser(user);
      StorageManager.sharedPreferences
          .setString(kLoginName, userModel.user.username);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }

  Future<bool> logout() async {
    if (!userModel.hasUser) {
      //防止递归
      return false;
    }
    setBusy();
    try {
      await RuoshuiRepository.logout();
      userModel.clearUser();
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
