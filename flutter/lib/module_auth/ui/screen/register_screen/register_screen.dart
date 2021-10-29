import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_auth/request/register_request/register_request.dart';
import 'package:taboola/module_auth/state_manager/register_state_manager/register_state_manager.dart';
import 'package:taboola/module_auth/ui/states/register_states/register_state.dart';
import 'package:taboola/module_auth/ui/states/register_states/register_state_init.dart';
import 'package:flutter/material.dart';
import 'package:taboola/utils/components/custom_app_bar.dart';
import 'package:taboola/utils/helpers/custom_flushbar.dart';

@injectable
class RegisterScreen extends StatefulWidget {
  final RegisterStateManager _stateManager;

  RegisterScreen(this._stateManager);

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  late RegisterState _currentState;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;
  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentState = RegisterStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (this.mounted) {
        setState(() {
          _currentState = event;
        });
      }
    });
    widget._stateManager.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
  }

  dynamic args;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        appBar: CustomTwaslnaAppBar.appBar(context,
            title: S.of(context).register, canGoBack: false),
        body: loadingSnapshot.connectionState != ConnectionState.waiting
            ? _currentState.getUI(context)
            : Stack(
                children: [
                  _currentState.getUI(context),
                  Container(
                    width: double.maxFinite,
                    color: Colors.transparent.withOpacity(0.0),
                  ),
                ],
              ),
      ),
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  void registerClient(RegisterRequest request) {
    widget._stateManager.registerClient(request, this);
  }

  void moveToNext() {
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil(MainRoutes.MAIN_SCREEN, (route) => false);

    CustomFlushBarHelper.createSuccess(
            title: S.current.warnning, message: S.current.loginSuccess)
        .show(context);
  }

  Future<void> userRegistered() async {
    await CustomFlushBarHelper.createSuccess(
            title: S.current.warnning,
            message: S.current.registerSuccess,
            timeout: 2)
        .show(context);
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }
}
