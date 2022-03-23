import 'package:c4sport_app/models/api_response.dart';
import 'package:c4sport_app/models/coach_model.dart';
import 'package:c4sport_app/utils/api_constants.dart';
import 'package:c4sport_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/23/2022 at 10:58 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CoachesApi {
  var _timeout = Duration(seconds: 30);

  Future<ApiResponse> getCoachesList({
    required Function(
      bool success,
      String message,
      List<CoachModel> response,
    )
        callback,
  }) async {
    var response = await http.get(Uri.parse(coachesListUrl));
    var jsonResponse = convert.jsonDecode(response.body);
    var _statusCode = response.statusCode;
    // logger.i(jsonResponse);
    List<CoachModel> coachesList = listCoachesFromJson(jsonResponse);
    callback(_statusCode == 200 || _statusCode == 201,
        _statusCode == 200 || _statusCode == 201 ? "Success" : "Failed", coachesList);
    ApiResponse apiResponse = ApiResponse();
    apiResponse.statusCode = _statusCode;
    apiResponse.data = coachesList;

    return apiResponse;
  }
}
