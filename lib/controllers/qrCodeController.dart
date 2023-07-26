import 'package:front_paye_ton_kawa/config/constants/ipadress.dart';
import 'package:http/http.dart' as http;

class QRCodeController {

  Future<String> getQRCode(String email) async {
    String urlString = '$ipaddress/api/v1/qrCode?email=$email';
    http.Response response = await http.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      // La requête a réussi, vous pouvez traiter la réponse ici
      String responseBody = response.body;
      return responseBody;
    } else {
      // La requête a échoué avec un code de statut autre que 200
      print('Échec de la requête : ${response.statusCode}');
      return "null";
    }
  }
}
