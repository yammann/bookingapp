import 'package:e_store/data/data-source/static/static.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String https) async {
  final Uri url = Uri.parse('https:$https');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchWhatsApp() async {
    String message = 'Hello!';
    
    final Uri url = Uri.parse('https://wa.me/$ownerPhoneNumber/?text=${Uri.encodeFull(message)}');
    
    if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
  }

void launchSendEmail(String email, String subject, String body) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
      'body': body,
    }),
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    print('Could not launch $emailLaunchUri');
  }
}
