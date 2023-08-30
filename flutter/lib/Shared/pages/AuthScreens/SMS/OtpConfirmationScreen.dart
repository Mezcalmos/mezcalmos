import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SMS"]["OtpConfirmationScreen"];

class OtpConfirmationScreen extends GetView<AuthController> {
  RxBool clickedSignInOtp = false.obs;
  RxInt _timeBetweenResending = 0.obs;
  RxBool canConfirmOtp = false.obs;
  // int get timeBetweenResending => _timeBetweenResending.value;
  void resendOtpTimerActivate(double time) {
    _timeBetweenResending.value = time.toInt();
    const Duration second = Duration(seconds: 1);
    Timer.periodic(
      second,
      (Timer __t) {
        print(
            "OTP Code resending available after ${_timeBetweenResending.value} Seconds !");
        if (_timeBetweenResending.value == 0)
          __t.cancel();
        else
          _timeBetweenResending.value--;
      },
    );
  }

  TextEditingController _otpCodeTextController = TextEditingController();
  //@abhishek pass this in as url paramaeter with navigate function expecting required arguments
  String _phonePassed = MezRouter.bodyArguments?["phone"];
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('${_i18n()["confirmation"]}'),
        ),
        bottomSheet: BottomSheet(
            enableDrag: false,
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (BuildContext context) {
              return Obx(
                () => confirmButton(_phonePassed, otpCode, context),
              );
            }),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(_i18n()["OtpConfirmation"],
                        overflow: TextOverflow.visible,
                        style: txt.displayLarge),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                otpConfimCard(
                    txt, _phonePassed, context, _otpCodeTextController),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Obx(
                    () => Text(
                      _i18n()["twilioNote"],
                      style: txt.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget otpConfimCard(TextTheme txt, String _phonePassed, BuildContext context,
      TextEditingController _otpCodeTextController) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => RichText(
                text: new TextSpan(
                  style: txt.bodyMedium,
                  children: <TextSpan>[
                    new TextSpan(
                        text: _i18n()["enterOtpCode"], style: txt.bodyMedium),
                    new TextSpan(
                        text: "  ${Get.arguments ?? _phonePassed}",
                        style: txt.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColorLight))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PinCodeTextField(
              backgroundColor: Colors.white,
              onTap: () {
                canConfirmOtp.value = false;
                _otpCodeTextController.clear();
              },
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'\d'), allow: true)
              ],
              controller: _otpCodeTextController,
              //  enabled: canConfirmOtp.value ? false : true,
              enableActiveFill: true,
              appContext: context,
              hintCharacter: "#",
              length: 6,
              // backgroundColor: Colors.grey.shade200,
              onCompleted: (String value) {
                canConfirmOtp.value = true;
                otpCode = value;
                mezDbgPrint(value);
              },
              onChanged: (String s) {
                otpCode = s;
              },

              cursorColor: Colors.purpleAccent,
              keyboardType: TextInputType.number,
              textStyle: TextStyle(fontSize: 18.mezSp, color: Colors.black87),
              pinTheme: PinTheme(
                borderRadius: BorderRadius.circular(5),
                borderWidth: 0.0,
                // fieldHeight: Get.width * 0.13,
                // fieldWidth: Get.width * 0.13,
                shape: PinCodeFieldShape.box,
                selectedFillColor: Colors.grey.shade100,
                activeColor: Colors.transparent,
                disabledColor: Colors.grey,
                inactiveColor: Colors.transparent,
                selectedColor: Colors.purple,
                activeFillColor: Colors.grey.shade100,
                inactiveFillColor: Colors.grey.shade100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    "${_i18n()["otpDidnReceiveTxt"]}",
                    style: txt.bodyMedium,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Obx(
                  () => Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: TextButton(
                        onPressed: _timeBetweenResending.value == 0
                            ? () async {
                                // resend code !
                                canConfirmOtp.value = false;
                                _otpCodeTextController.clear();
                                SendOtpResponse? response =
                                    await sendOTPForLogin(
                                        Get.arguments ?? _phonePassed);
                                mezDbgPrint(response);
                                if (response?.success == false) {
                                  resendOtpTimerActivate(
                                      response!.secondsLeft!.toDouble());
                                  MezSnackbar(
                                      "Error", response.error.toString(),
                                      position: Alignment.topCenter);
                                }
                              }
                            : null,
                        style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            backgroundColor: _timeBetweenResending.value == 0
                                ? Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.8)
                                : Colors.grey),
                        child: Text(
                          _timeBetweenResending.value == 0
                              ? _i18n()["resend"]
                              : "${_i18n()["resendAfter"]} ${_timeBetweenResending.value} ${_i18n()["seconds"]}",
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget confirmButton(
      String _phonePassed, String otpCode, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      child: TextButton(
          onPressed: canConfirmOtp.value
              ? () async {
                  clickedSignInOtp.value = true;
                  mezDbgPrint(
                      "${Get.arguments ?? _phonePassed} -------------- $otpCode ");
                  final AuthResponse? _resp = await signInUsingOTP(
                      Get.arguments ?? _phonePassed, otpCode);

                  switch (_resp?.success) {
                    case null:
                      clickedSignInOtp.value = false;
                      break;

                    case false:
                      switch (_resp?.error) {
                        case AuthOtpError.InvalidOTPCode:
                          MezSnackbar(
                              "Oops ..", '${_i18n()['invalidOTPCode']}');
                          break;
                        case AuthOtpError.ExceededNumberOfTries:
                          MezSnackbar(
                              "Oops ..", '${_i18n()['exceededNumberOfTries']}');
                          break;
                        default:
                          MezSnackbar(
                              "Oops ..", '${_i18n()['unhandledError']}');
                      }

                      clickedSignInOtp.value = false;
                      break;
                  }
                }
              : null,
          style: TextButton.styleFrom(
              fixedSize: Size(double.infinity, 60),
              backgroundColor: canConfirmOtp.value && !clickedSignInOtp.value
                  ? Theme.of(context).primaryColorLight
                  : Colors.grey),
          child: Container(
            alignment: Alignment.center,
            child: (clickedSignInOtp.value)
                ? CircularProgressIndicator()
                : Text(_i18n()["confirm"]),
          )),
    );
  }
}
