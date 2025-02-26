import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/calert_dialog.dart';
import 'package:myapp/core/widgets/ctext.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/main.dart';
import 'package:myapp/utils/helpers/social_login_helper.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cText(
          'Or Login with',
          style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
        ),
        const VGap(7),
        SizedBox(
          width: 210,
          height: 40,
          child: Row(
            children: [
              ...List.generate(4, (index) {
                final socialData = SocialLoginHelper.socialLogin[index];
                return Expanded(
                  child: _SocialMediaIcons(
                    onPressed: _onPressed,
                    child: socialData.icon,
                  ),
                );
              }),
              Expanded(
                child: IconButton(
                  onPressed: _onPressed,
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onPressed() {
    customDialog(
      content: SizedBox(
        width: 330,
        height: 220,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 15,
          // mainAxisSpacing: 10,
          semanticChildCount: SocialLoginHelper.socialLogin.length,
          crossAxisCount: 3,
          children: List.generate(SocialLoginHelper.socialLogin.length, (
            index,
          ) {
            final socialData = SocialLoginHelper.socialLogin[index];
            return Padding(
              padding: EdgeInsets.all(index == 6 || index == 8 ? 0 : 12),
              child: _SocialMediaIcons(
                onPressed: () async {
                  Get.back();
                  await _SignInHelper().getController(socialData.url);
                },
                child: socialData.icon,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _SocialMediaIcons extends StatelessWidget {
  const _SocialMediaIcons({required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed, child: child);
  }
}

class _SignInHelper {
  Future<void> getController(String endpoint) async {
    final params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #
    await controller.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: onPageFinished,
        onPageStarted: onPageStarted,
        onProgress: onProgress,
      ),
    );
    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.clearCache();
    await controller.setUserAgent('Chrome/81.0.0.0 Mobile');
    await Navigator.push(
      Get.context!,
      MaterialPageRoute<void>(
        builder: (context) => WebViewWidget(controller: controller),
      ),
    );
  }

  Future<void> onPageFinished(String url) async {
    final query = Uri.parse(url).queryParameters['token'];
    if (query != null) {
      // ref.read(loaderStateProvider.notifier).hideLoader();

      // await HiveAuthService().updateToken(query);
      // popUntilPath(Get.context!, const HomeScreen());
    }
  }

  void onPageStarted(String url) {
    // ref.read(loaderStateProvider.notifier).showLoader();
  }

  void onProgress(int progress) {
    if (progress == 100) {
      // ref.read(loaderStateProvider.notifier).hideLoader();
    }
  }
}

// CTextButton(
//       onPressed: () {
//         cAlertDialog<void>(
//           title: const cText(
//             'Social Login',
//             textAlign: TextAlign.center,
//           ),
//           context: context,
//           content: SizedBox(
//             width: 330,
//             height: 200,
//             child: GridView.count(
//               padding: const EdgeInsets.all(20),
//               crossAxisSpacing: 60,
//               mainAxisSpacing: 20,
//               semanticChildCount: SocialLoginHelper.socialLogin.length,
//               crossAxisCount: 3,
//               children: SocialLoginHelper.socialLogin.map((socialData) {
//                 return SizedBox(
//                   height: 50,
//                   child: _SocialMediaIcons(
//                     onPressed: () async {
//                       context.pop();
//                       await _SignInHelper(ref: ref)
//                           .getController(socialData.url);
//                     },
//                     child: socialData.icon,
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//       text: 'Or Login with',
//       textStyle: const TextStyle(color: UIColors.textTertiary, fontSize: 14),
//     );
