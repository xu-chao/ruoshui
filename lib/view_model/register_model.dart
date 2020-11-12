import 'package:xuchao/provider/view_state_model.dart';
import 'package:xuchao/services/ruoshui_repository.dart';

class RegisterModel extends ViewStateModel {
  Future<bool> singUp(loginName, password, rePassword) async {
    setBusy();
    try {
      await RuoshuiRepository.register(loginName, password, rePassword);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
