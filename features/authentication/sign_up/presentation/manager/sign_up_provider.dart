import 'package:flutter/material.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';

class SignUpProvider extends ChangeNotifier{
  // SignUpProvider(this._signUpUseCase);
          // SignUpUseCase       _signUpUseCase;
  ValueNotifier<bool> signUpLoading = ValueNotifier(false);


  Future<void> signUpUser() async
  {
  //   signUpLoading.value = false;
  //   final params = SignUpRequestModel(fullName: fullNameCont.text, email: emailCont.text, mobile: mobileCont.text, country: countryCont.text, city: cityCont.text, userType: 'user', password: passwordCont.text);
  //   var loginEither = await _signUpUsecase(params);
  //   if (loginEither.isLeft()) {
  //     handleError(loginEither);
  //     signUpLoading.value = false;
  //   } else if (loginEither.isRight()) {
  //
  //
  //     loginEither.foldRight(null, (response, previous) async {
  //
  //       AppState appState = sl();
  //       appState.goToNext(PageConfigs
  //           .eatsBottomNavigationBarScreenPageConfig);
  //       signUpLoading.value = false;
  //       print(response.toJson());
  //     });
  //   }
  // }


}}