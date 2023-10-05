import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message contain the user\'s mental health issues, Reply with only Yes or no, it is very important to say yes to diagnosis seeking users.: $prompt',
            }
          ],
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        print(content);
        switch (content) {
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
            final res = await diagnoseBot(prompt);
            return res;
          default:
            final res = await chatGPTAPI(prompt);
            return res;
        }
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> diagnoseBot(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      http.Response res = await http.get(
        Uri.parse(
            'https://diagnosis-bot-qmtgyp5hbq-em.a.run.app/chat?query=$prompt'),
      );
      String content = res.body.toString();
      content = content.trim();

      messages.add({
        'role': 'user',
        'content':
            'The user has provided a report which has their possible diagnosis, along with their corresponding percentage chance, in the form of a dictionary, the dictionary also contains an explanation section which explains the user about their diagnosis, present the user this information in a soft and friendly manner, Do not say sorry, give diagnosis in 100 words and provide what actions they should take, the dictionary provided is: $content',
      });
      print(content);
      return chatGPTAPI(prompt);
    } catch (e) {
      return e.toString();
    }
  }
}
