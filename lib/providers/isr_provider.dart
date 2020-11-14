import 'package:http/http.dart' as http;
import 'package:jose/jose.dart';

class IsrProvider {
  static Future<http.Response> calculateISR(double brute_wage) async {
    var secret =
        "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC90SKDXHR+aZfcGx4TuXA0HHml6o5luHrUttR9wZrHkfWSkHcg+ieR3SletP3OgqOODbTi3qsV/LLkqeej5oX4irMdr3oAgjUJWHpz2+HSn4hQIk+yXCkFxDPBYtt7kPbcjuqpJPXUzl4kC2VBLnSj0+/+ZCADGVKg63somfMlz2wBhoJUcKDyXE2Df4d5G6MYd9td3vQkbVTNCEYfBFtlV/hLIgBG3JLad27HVg/LuuL3rHnhUc1rGP4zcfBSrBPLojR2BTCJv7X4thGRJ5AawmmqZJMnJ3ZHsqCHfDEBBfNC+OeLCToSLhnRUkYMjR+TxcBcAkAyWa4E4mRXF5GdAgMBAAECggEANwRsh/2eyFsryIDVpWrs0jXkron/Tw17ELeTfIXGqoysTJhx5w2KtZUQXiKApEAqTsy7PrzCgwN1CKEUgmWZNDJjezm213nmDHjoOTekyysxU+S2C+D5hPHa/HT+X+DjJIeKDY+ob0+HatQgu5VO+oM9/xKfUraexASs9FY26yCliC6m92pjLynN9FN8FXB2ce5RjA8Hvi2KczkBBQJiPYNwhY+vF/BFUX6beo9T++7T3ucqGdoGrwh49KdMEU1dVVqPd5X0eSdgl94/x71tMhCLq2bmZEsy/w6R5kbbKMlKxGAJhDnh/awj/wqMO2TWLaoVVdj64qtzAtqydutKIwKBgQDdTNjkTWA2yrWYf28V0uCNwBX1Cas3R3oOpRjHymzIns7xGe/ktVOCuHWy2XtSGRRf9Eixs/oOdSNjJjyACzCqkDvYRgO95LZ4UBaEaWIqMJue6DHMRW0WqZ5zFE8Tl4mURiwEr1gF2kJYqzM5ZNUGOpWTGme/a0U3ORgPlAYQlwKBgQDblIbQu8Hevh7kbP76qAJVdMgI1o5fVmZrM0wR0jmOJ4MvdghofHIn1chWIRic3Vq9nUStYM1wY8l++kHA48tmtzTjj47JKHN9PUFOO2JGy/JUg1/840GkzC6sdUL+1nzJwXwIea7XtKeEz3wOcQ5WKawEC38RVdl1uHYyiTBB6wKBgFfV1JBpFbMpqgIpMlIbLP2WLCDiAY8jU5LUfI1wDtViEwknHkxMnCTaSfz+zS+8vJWJRAEkSi/K1ozX9FNuHZbVQKuKvpl0WehPAWD04v2T5XChAILvW2kPUdCjUu+XygeMApSpc+p+wq6m5OH234ZlYlDMvjj/vq04gBBO1ElpAoGAavbGWaYtAcmRmOqzpvzy7hgOXafPAQhAqhX6B3BmEyaSVCtmWyfMIDWW+sXyjG+UBWw4CVFvokEp5c4Y+9K7wdSbUgMbpkgrQiX1yxtIe35cFOlOeA1oa9P/JImW0jc/4LR9LE/CaVeahyrfntVaC4UPQ4UqKBKu9RaflWyY8nMCgYEAzjJZrx5dh2ovRwh9p6tOR9HJ5rPWrlp34qGZqbgjcNcdEIWqtHOlRChzLDp/2k3PnbUO8OZZKPGGj9j5ExovrwQdnmlEjxmIUCmh5qdy8/RrGyinedIJTATh3sjxYbgujYr8o5oQ1z5ihoVBRzPnX1yfkU+TYBCtgw4rbfj7giE=";
    // create a builder
    var builder = new JsonWebSignatureBuilder();
    // set the content
    var payload = {
      "iss": "desarroladoradmin@desarrollos-test.iam.gserviceaccount.com",
      "scope": "https://isr-urhxsjsspa-uc.a.run.app",
      "aud": "https://oauth2.googleapis.com/token",
      "exp": 1604967881.3350067,
      "iat": 1604967281.3350067
    };
    builder.jsonContent = payload;
    // set some protected header
    builder.setProtectedHeader("alg", "RS256");
    builder.setProtectedHeader("typ", "JWT");

    // add a key to sign, you can add multiple keys for different recipients
    // builder.addRecipient(new JsonWebKey.fromJson({"kty": "RSA", "k": secret}),
    //     algorithm: "RS256");
    builder.addRecipient(new JsonWebKey.generate("rsa"));

    var jws = builder.build();

    // output the json serialization
    print("jws json serialization: ${jws.toJson()}");
    return null;
  }
}

final isr_provider = new IsrProvider();
