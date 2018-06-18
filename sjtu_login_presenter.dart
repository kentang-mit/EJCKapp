import 'dart:async';
import 'sjtu_auth.dart' as sjtu;
import 'const.dart';
abstract class LoginViewContract {
  void onLoginScuccess(sjtu.Token token);
  void onLoginError(String message);
}

class LoginPresenter {
  LoginViewContract _view;
  LoginPresenter(this._view);

  void perform_login() {
    assert(_view != null);
    String appId = constants.APP_ID;
    String appSecret = constants.APP_SECRET;
    sjtu.getToken(appId, appSecret).then((token)
    {
      if (token != null) {
        _view.onLoginScuccess(token);
      }
      else {
        _view.onLoginError('Error');
      }
    });
  }
}