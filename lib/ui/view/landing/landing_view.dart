import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/ui_helpers/app_colors.dart';
import 'package:todo_app/ui/ui_helpers/shared_styles.dart';
import 'package:todo_app/ui/ui_helpers/ui_helpers.dart';

import 'landing_viewmodel.dart';

class LandingView extends HookWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textEditingController = useTextEditingController();
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (
        BuildContext context,
        LandingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpaceLarge,
                  LottieBuilder.asset(
                    "assets/animations/welcome.json",
                    height: 300,
                  ),
                  verticalSpaceTiny,
                  const Center(
                    child: Text(
                      "MANAGE YOUR DAY \nWITH ME",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: kcWhite),
                    ),
                  ),
                  verticalSpaceLarge,
                  Text(
                    "Your Name".toUpperCase(),
                    style: TextStyle(fontSize: 25, color: kcWhite),
                  ),
                  verticalSpaceSmall,
                  Padding(
                    padding: customDialogPadding,
                    child: TextField(
                      style: TextStyle(color: kcWhite),
                      controller: _textEditingController,
                      decoration: InputDecoration(),
                    ),
                  ),
                  verticalSpaceLarge,
                  Center(
                      child: ElevatedButton(
                          style: kbtsLetsGoButtonStyle,
                          onPressed: () {
                            if (_textEditingController.text.isNotEmpty) {
                              model.registerUserName(
                                  _textEditingController.text.trim());
                            } else {
                              return;
                            }
                          },
                          child: Text("Lets Go")))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
