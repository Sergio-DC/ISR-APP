import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:googleapis_auth/auth_io.dart";
import 'dart:io';

class IsrProvider {
  static Future<http.Response> calculateISR(double brute_wage) async {
    var response = await http
        .get('https://jwt-acces-token-generator-urhxsjsspa-uc.a.run.app/token');

    var objJson = json.decode(response.body);
    var access_token = objJson['response']['id_token'];
    return http.get('https://isr-urhxsjsspa-uc.a.run.app/ISR/$brute_wage',
        headers: {'Authorization': 'Bearer $access_token'});
  }
}
//  Future<http.Response> calculateISR(double brute_wage) {
//     return http.get('https://isr-urhxsjsspa-uc.a.run.app/ISR/$brute_wage',
//         headers: {"Authorization": 'Bearer $token'});
//   }

// static void DoProcess() {
//   final private_key_id = "ad06b379781f1f5cdb4f841fb5d46f2d718b217c";
//   final private_key =
//       "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC90SKDXHR+aZfc\nGx4TuXA0HHml6o5luHrUttR9wZrHkfWSkHcg+ieR3SletP3OgqOODbTi3qsV/LLk\nqeej5oX4irMdr3oAgjUJWHpz2+HSn4hQIk+yXCkFxDPBYtt7kPbcjuqpJPXUzl4k\nC2VBLnSj0+/+ZCADGVKg63somfMlz2wBhoJUcKDyXE2Df4d5G6MYd9td3vQkbVTN\nCEYfBFtlV/hLIgBG3JLad27HVg/LuuL3rHnhUc1rGP4zcfBSrBPLojR2BTCJv7X4\nthGRJ5AawmmqZJMnJ3ZHsqCHfDEBBfNC+OeLCToSLhnRUkYMjR+TxcBcAkAyWa4E\n4mRXF5GdAgMBAAECggEANwRsh/2eyFsryIDVpWrs0jXkron/Tw17ELeTfIXGqoys\nTJhx5w2KtZUQXiKApEAqTsy7PrzCgwN1CKEUgmWZNDJjezm213nmDHjoOTekyysx\nU+S2C+D5hPHa/HT+X+DjJIeKDY+ob0+HatQgu5VO+oM9/xKfUraexASs9FY26yCl\niC6m92pjLynN9FN8FXB2ce5RjA8Hvi2KczkBBQJiPYNwhY+vF/BFUX6beo9T++7T\n3ucqGdoGrwh49KdMEU1dVVqPd5X0eSdgl94/x71tMhCLq2bmZEsy/w6R5kbbKMlK\nxGAJhDnh/awj/wqMO2TWLaoVVdj64qtzAtqydutKIwKBgQDdTNjkTWA2yrWYf28V\n0uCNwBX1Cas3R3oOpRjHymzIns7xGe/ktVOCuHWy2XtSGRRf9Eixs/oOdSNjJjyA\nCzCqkDvYRgO95LZ4UBaEaWIqMJue6DHMRW0WqZ5zFE8Tl4mURiwEr1gF2kJYqzM5\nZNUGOpWTGme/a0U3ORgPlAYQlwKBgQDblIbQu8Hevh7kbP76qAJVdMgI1o5fVmZr\nM0wR0jmOJ4MvdghofHIn1chWIRic3Vq9nUStYM1wY8l++kHA48tmtzTjj47JKHN9\nPUFOO2JGy/JUg1/840GkzC6sdUL+1nzJwXwIea7XtKeEz3wOcQ5WKawEC38RVdl1\nuHYyiTBB6wKBgFfV1JBpFbMpqgIpMlIbLP2WLCDiAY8jU5LUfI1wDtViEwknHkxM\nnCTaSfz+zS+8vJWJRAEkSi/K1ozX9FNuHZbVQKuKvpl0WehPAWD04v2T5XChAILv\nW2kPUdCjUu+XygeMApSpc+p+wq6m5OH234ZlYlDMvjj/vq04gBBO1ElpAoGAavbG\nWaYtAcmRmOqzpvzy7hgOXafPAQhAqhX6B3BmEyaSVCtmWyfMIDWW+sXyjG+UBWw4\nCVFvokEp5c4Y+9K7wdSbUgMbpkgrQiX1yxtIe35cFOlOeA1oa9P/JImW0jc/4LR9\nLE/CaVeahyrfntVaC4UPQ4UqKBKu9RaflWyY8nMCgYEAzjJZrx5dh2ovRwh9p6tO\nR9HJ5rPWrlp34qGZqbgjcNcdEIWqtHOlRChzLDp/2k3PnbUO8OZZKPGGj9j5Exov\nrwQdnmlEjxmIUCmh5qdy8/RrGyinedIJTATh3sjxYbgujYr8o5oQ1z5ihoVBRzPn\nX1yfkU+TYBCtgw4rbfj7giE=\n-----END PRIVATE KEY-----\n";
//   final client_email = "team-2@desarrollos-test.iam.gserviceaccount.com";
//   final client_id = "108985807970810649589";

//   var accountCredentials = ServiceAccountCredentials.fromJson({
//     "private_key_id": private_key_id,
//     "private_key": private_key,
//     "client_email": client_email,
//     "client_id": client_id,
//     "type": "service_account"
//   });

//   var scopes = [
//     // 'https://accounts.google.com/o/oauth2/auth',
//     "https://oauth2.googleapis.com/token",
//     // "https://www.googleapis.com/oauth2/v1/certs",
//     // "https://www.googleapis.com/robot/v1/metadata/x509/team-2%40desarrollos-test.iam.gserviceaccount.com"
//   ];
//   clientViaServiceAccount(accountCredentials, scopes)
//       .then((AuthClient client) {
//     // [client] is an authenticated HTTP client.
//     // ...
//     print("Client: ${client}");
//     client.close();
//   });
//   // var client = new http.Client();
//   // obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client)
//   //     .then((AccessCredentials credentials) {
//   //   print("Credentials: ${credentials}");
//   //   client.close();
//   // });
//   // }).catchError((onError) {
//   //   print('Error: ${onError.}');
//   // });
// }

final isr_provider = new IsrProvider();
