import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/helpers/MezUpdateHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:new_version/new_version.dart';
import 'package:store_redirect/store_redirect.dart';

class AppNeedsUpdated extends StatefulWidget {
  const AppNeedsUpdated({Key? key}) : super(key: key);

  @override
  State<AppNeedsUpdated> createState() => _AppNeedsUpdatedState();
}

class _AppNeedsUpdatedState extends State<AppNeedsUpdated> {
  final AppVersionController _controller = Get.find<AppVersionController>();
  MezAppUpdateResult? _results;
  RxBool _isDownloading = false.obs;
  UpdateType _updateType = UpdateType.Null;
  VersionStatus? _versionStatus;

  @override
  void initState() {
    _updateType = Get.arguments?['updateType'];
    _versionStatus = Get.arguments?['versionStatus'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _floatingActionBtn(),
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: _results != MezAppUpdateResult.success ? null : Get.back,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  child: Image.asset(
                    aUpdate,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Flexible(
                flex: 1,
                child: Obx(
                  () {
                    if (_versionStatus != null) {
                      return Text(
                        "New version ${_versionStatus?.storeVersion} is out!", //remoteVersion
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: Colors.purple.shade900,
                            ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              //if (_controller.appVersionInfo.value?.updateNews != null)
              Flexible(
                flex: Platform.isAndroid ? 3 : 2,
                child: Platform.isAndroid
                    ? _androidUpdateInfosAndButton()
                    : _iosUpdateInfos(context),
              ),

              isDownloadInProgress(context),

              //else
            ],
          ),
        ),
      ),
    );
  }

  Widget? _floatingActionBtn() {
    return Platform.isAndroid
        ? null
        : FloatingActionButton(
            tooltip: "Download New version",
            focusColor: Colors.white,
            hoverColor: Colors.white,
            splashColor: Colors.white,
            foregroundColor: Colors.purple.shade400,
            backgroundColor: Colors.white,
            onPressed: () {
              StoreRedirect.redirect(
                androidAppId: getPackageName(platform: MezPlatform.ANDROID),
                iOSAppId: getPackageName(platform: MezPlatform.IOS),
              );
            },
            child: Icon(Icons.download),
          );
  }

  Obx isDownloadInProgress(BuildContext context) {
    return Obx(
      () => Flexible(
        flex: 1,
        child: _isDownloading.value
            ? Text(
                "A new version is being downloaded...",
                //remoteVersion
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      color: Colors.purple.shade900,
                    ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Container _iosUpdateInfos(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "v${_versionStatus?.storeVersion} news:",
              textAlign: TextAlign.start,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 25),
            Text(
              _versionStatus?.releaseNotes ?? "",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }

  // com.mezcalmos.customer -> 1.0.0+1
  Column _androidUpdateInfosAndButton() {
    return Column(
      children: <Widget>[
        Obx(
          () {
            if (_versionStatus != null) {
              return Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Update info: ${_versionStatus.toString()}',
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        const SizedBox(height: 26),
        ElevatedButton(
          child: Text('Update'),
          onPressed: () async {
            _isDownloading.value = true;
            final MezAppUpdateResult? _res =
                await _controller.startAppUpdate(_updateType);
            _handleUpdateResults(_res);
            _isDownloading.value = false;
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _handleUpdateResults(MezAppUpdateResult? _result) {
    switch (_result) {
      case MezAppUpdateResult.success:
        // TODO : reopen app
        break;
      case MezAppUpdateResult.inAppUpdateFailed:
      //
      case MezAppUpdateResult.redirectedToStore:
      case MezAppUpdateResult.userDeniedUpdate:
      default:
    }
  }
}
