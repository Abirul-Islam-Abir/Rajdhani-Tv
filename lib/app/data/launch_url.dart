import 'package:url_launcher/url_launcher.dart';

Future<void> launchAnyUrl(  url) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
    webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
  )) {
    throw Exception('Could not launch $url');
  }
}