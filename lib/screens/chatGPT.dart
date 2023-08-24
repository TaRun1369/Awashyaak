import '../chatbot/apiServices.dart';
import '../chatbot/chatMessege.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  TextToSpeech tts = TextToSpeech();
  stt.SpeechToText speech = stt.SpeechToText();

  var searchQuery = "hello";

  var scrollController = ScrollController();

  scrollMeathod() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  Future<void> addNewMessage() async {
    messages.add(ChatMessage(message: searchQuery, type: ChatType.user));
    var msg = await ApiServices.sendMessage(searchQuery);
    scrollMeathod();
    setState(() {
      messages.add(ChatMessage(message: msg, type: ChatType.bot));
    });
  }

  final List<ChatMessage> messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondryColor,
      appBar: AppBar(
        title: const Text(
          "Ask me",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                var chat = messages[index];
                return chatBubble(
                  chatText: chat.type == ChatType.bot
                      ? chat.message!.substring(2)
                      : chat.message,
                  type: chat.type,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
            child: Stack(
              children: [
                SizedBox(
                  height: 60,
                  child: TextField(
                    onChanged: (value) => {
                      searchQuery = value,
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: lightColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                      hintText: "Enter your question here",
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addNewMessage();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        child: const Icon(Icons.search_outlined)),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chatBubble({required chatText, required ChatType? type}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection:
            type == ChatType.user ? TextDirection.ltr : TextDirection.rtl,
        children: [
          InkWell(
            onTap: () {
              tts.setVolume(1.0);
              tts.setRate(1.0);
              tts.setPitch(1.0);
              tts.setLanguage('en-US');
              tts.speak(chatText);
            },
            onDoubleTap: () {
              tts.stop();
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: type == ChatType.user
                  ? primaryColor
                  : const Color.fromARGB(133, 7, 114, 27),
              child: Icon(
                type == ChatType.user ? Icons.person : Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: type == ChatType.user
                      ? const Radius.circular(0)
                      : const Radius.circular(20),
                  topRight: type == ChatType.user
                      ? const Radius.circular(20)
                      : const Radius.circular(0),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
                color: type == ChatType.user
                    ? indibg
                    : const Color.fromARGB(255, 159, 223, 203),
              ),
              child: Text(
                chatText,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            width: 48,
          ),
        ],
      ),
    );
  }
}
