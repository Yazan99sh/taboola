import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:taboola/module_auth/ui/states/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:taboola/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/helpers/custom_flushbar.dart';
import 'package:taboola/utils/images/images.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(
          title: S.current.warnning, message: error)
        ..show(screen.context);
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool validPassword = false;
  bool validEmail = false;

  @override
  Widget getUI(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: BackgroundScreen(
        checkIfCenter: true,
        child: Stack(
          children: [
            BackgroundScreen(child:SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAsset.FULL_LOGO_IMAGE,
                      height: 200,
                      width: 200,
                    ),
                    InputField(
                      controller: emailController,
                      hintText: S.current.email,
                      validText: validEmail,
                      errorText: S.current.pleaseEnterYourEmail,
                      valueChanged: (value) {
                        validEmail = false;
                        screen.refresh();
                      },
                      iconData: Icons.email,
                      textInputType: TextInputType.emailAddress,
                    ),
                    InputField(
                      controller: passwordController,
                      hintText: S.current.password,
                      errorText: S.current.pleaseEnterYourPassword,
                      valueChanged: (value) {
                        validPassword = false;
                        screen.refresh();
                      },
                      iconData: Icons.password_rounded,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    // Container(
                    //   alignment: Alignment.bottomLeft,
                    //   padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Text(
                    //       S.current.f,
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (emailController.text.isEmpty) {
                          validEmail = true;
                          return;
                        }
                        if (passwordController.text.isEmpty) {
                          validPassword = true;
                          return;
                        }
                        screen.loginClient(emailController.text, passwordController.text);
                        screen.refresh();
                      },
                      child:Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.15),
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(
                            left: 30.0, top: 10.0, right: 30.0),
                        child: Center(
                            child:screen.loadingSnapshot.connectionState != ConnectionState.waiting ?  Text(
                              S.current.login,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ) : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
