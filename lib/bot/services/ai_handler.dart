import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class AIHandler {
  Future<String> getResponse(String message) async {
    String apiUrl =
        'http://127.0.0.1:8081/chat?query=${message.removeAllWhiteSpace()}';
    print(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl));
      String res = jsonDecode(response.body)['response'];
      return res;
    } catch (e) {
      return e.toString();
    }
  }
  // final _openAI = OpenAI.instance.build(
  //   token: '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',
  //   baseOption: HttpSetup(
  //     receiveTimeout: const Duration(seconds: 60),
  //     connectTimeout: const Duration(seconds: 60),
  //   ),
  // );

  // Future<String> getResponse(String message) async {

  //   try {
  //     final request = ChatCompleteText(messages:  [

  //     ], maxToken: 200, model:GptTurboChatModel());

  //     final response = await _openAI.onChatCompletion(request: request);
  //     if (response != null) {
  //       return response.choices[0].message!.content.trim();
  //     }

  //     return 'Some thing went wrong';
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // void dispose() {

  //   // _openAI.close();

  // }
}
