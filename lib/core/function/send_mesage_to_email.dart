import 'package:http/http.dart' as http;

Future<void> sendMesageToEmail(String toEmail, String subject, String body) async {
  const url = 'https://api.elasticemail.com/v2/email/send';

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: {
      'apikey': "66837702C995DAE528E97790EB8FC03E08EB603BCB8D576BBB502E6EE924339229A74F1ACA7E180F50E81C5CB9B20B01",
      'from': "buzzard.black19977@gmail.com",
      'to': toEmail,
      'subject': subject,
      'body': body,
    },
  );

  if (response.statusCode == 200) {
    print('--------------------------------------------------Email sent successfully!');
  } else {
    print('***************************************************Failed to send email: ${response.body}');
  }
}