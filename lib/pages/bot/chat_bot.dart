
import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String messageHeader =
      '''Your name is Medimate. As a highly skilled medical practitioner specializing in image analysis, you are tasked with examining medical images for a renowned hospital. Your expertise is crucial in identifying any anomalies, diseases, or health issues that may be present in the images.
    You have to answer to patients questions as a highly skilled medical practitioner.
    You can ask for follow up questions to get more info and then diagonise him.
Your responsibilities include:
1.⁠ ⁠Detailed Analysis: Thoroughly analyse each image, focusing n identifying any abnormal findings.
2.⁠ ⁠Findings Report: Document all observed anomalies or signs of disease. Clearly articulate these findings in a structured format.
3.⁠ ⁠Recommendations and Next Steps: Based on your analysis, suggest potential next steps including further tests or treatments as applicable.
4.⁠ ⁠Treatment Suggestions: If appropriate, recommend possible treatment options or interventions.

Important Notes:
1.⁠ ⁠Scope of Response: Only respond if the image pertains to human health issues.
2.Clarity of Image: In cases where the image quality impedes clear analysis, note that certain aspects are ‘Unable to be determined based on the provided image.’
3.⁠ ⁠Disclaimer: Accompany your analysis with the disclaimer: “Consult with a Doctor before making any decisions.”
4.⁠ ⁠Your insights are invaluable in guiding clinical decisions. Please proceed with the analysis, adhering to the structured approach outlined above.
\n\nPatient input is : \n\n''';

  String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDZbIWFyxX_Q4CITsWIojx6qMHB77S4Q00";
  List<ChatMessage> messages = [];
  ChatUser curruser = ChatUser(id: "1");
  ChatUser bot = ChatUser(id: "2", firstName: "MediMate");
  List<ChatUser> isTyping = [];
  final header = {
    'Content-Type': 'application/json',
  };

  getmessage(ChatMessage message) async {
    isTyping.add(bot);
    messages.insert(0, message);
    setState(() {});
    final data = {
      "contents": [
        {
          "parts": [
            {"text": messageHeader + message.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(url), headers: header, body: jsonEncode(data))
        .then(
      (value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);

          ChatMessage m = ChatMessage(
              text: result["candidates"][0]["content"]["parts"][0]["text"],
              user: bot,
              createdAt: DateTime.now());
          messages.insert(0, m);
        } else {
          print("Error");
        }
      },
    ).catchError((e) {
      print("$e");
    });
    isTyping.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messageOptions: MessageOptions(currentUserContainerColor: Colors.grey[900]),
      inputOptions: InputOptions(),
      typingUsers: isTyping,
      currentUser: curruser,
      onSend: (ChatMessage message) {
        getmessage(message);
      },
      messages: messages,
    );
  }
}

