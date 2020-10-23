import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oauth2_client/google_oauth2_client.dart';
//import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'dart:io';

class IsrProvider {
  static void DoProcess() {
    final private_key =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjVlZmZhNzZlZjMzZWNiNWUzNDZiZDUxMmQ3ZDg5YjMwZTQ3ZDhlOTgiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiIzMjU1NTk0MDU1OS5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImF6cCI6InRlYW0tMkBkZXNhcnJvbGxvcy10ZXN0LmlhbS5nc2VydmljZWFjY291bnQuY29tIiwiZW1haWwiOiJ0ZWFtLTJAZGVzYXJyb2xsb3MtdGVzdC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJleHAiOjE2MDIzMzk4NzksImlhdCI6MTYwMjMzNjI3OSwiaXNzIjoiaHR0cHM6Ly9hY2NvdW50cy5nb29nbGUuY29tIiwic3ViIjoiMTA4OTg1ODA3OTcwODEwNjQ5NTg5In0.K_XVPgRxHfHAPWCsQayBi-B8DcB--4e2Yjqe-wmMprzNTjk1mXbcyuY7qw9ug-oGX_JYJxWCHzXXsBoIbf_RmiSaO9ZIiJRT4mUYuQRJ7po0y8s7DBYLfGx0wj5VpMitZU7e9KWHTShW66ULhcbdji4PPmAFrDWHqCVo06wibFk6tFMiQTjMF6cGlDe3APsoT7L4vtSKjQT_09BhGbkwGorKaBgNfM-jgII4skJ9DZj2RXDIKxaJryICIJvhpMP6bxdyj5StWso27Cni4hANILeOtVegmxmiUCcEhHmApJOt7WuiB0vW00GlVJ0rgGxunPObSkv5ZqTtEi8oWP6JCw";
    final clientId = '108985807970810649589';
    GoogleOAuth2Client client = GoogleOAuth2Client(
      customUriScheme:
          'my.test.app', //Must correspond to the AndroidManifest's "android:scheme" attribute
      redirectUri:
          'my.test.app://oauth2redirect', //Can be any URI, but the scheme part must correspond to the customeUriScheme
    );
    //Then, instantiate the helper passing the previously instantiated client
    OAuth2Helper helper = OAuth2Helper(client,
        grantType: OAuth2Helper.AUTHORIZATION_CODE,
        clientId: clientId,
        clientSecret: private_key,
        scopes: ['https://accounts.google.com/o/oauth2/auth']);

    helper
        .get('https://isr-urhxsjsspa-uc.a.run.app/ISR/25000')
        .then((http.Response res) {
      print("Respuesta (: ${res.body}");
    });
  }
}

// Future<http.Response> calculateISR(double brute_wage) {
//   return http.get('https://isr-urhxsjsspa-uc.a.run.app/ISR/$brute_wage',
//       headers: {"Authorization": 'Bearer $token'});
// }

final isr_provider = new IsrProvider();
