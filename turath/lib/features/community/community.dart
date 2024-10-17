import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turath/core/utils/app_colors.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser; // give us email

class communityscreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const communityscreen({Key? key}) : super(key: key);

  @override
  _communityscreenState createState() => _communityscreenState();
}

class _communityscreenState extends State<communityscreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  User? signedInUser; // give us email
  String? messageText; // give us message

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }



  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Community",
          style: TextStyle(
            color: AppColors.textColorPrimary,
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15),
            child: Icon(
              Icons.chat_sharp,
              size: 40,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Messagestreambuilder(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    style: const TextStyle(
                      color: Colors.white, // تحديد اللون الأبيض للنص
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'message ....',
                      hintStyle: TextStyle(
                        color: Colors
                            .white70, // تحديد لون النص التلميحي (Hint) بلون قريب من الأبيض
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    messageTextController.clear();
                    _firestore.collection("messages").add({
                      "text": messageText,
                      "sender": signedInUser!.email,
                      "time": FieldValue.serverTimestamp(),
                    });
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: (CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.send,
                          color: AppColors.secondaryColor,
                        ))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Messagestreambuilder extends StatelessWidget {
  const Messagestreambuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("messages").orderBy("time").snapshots(),
        builder: (context, snapshot) {
          List<messageline> messageWidgets = [];

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }

          final messages = snapshot.data?.docs.reversed ?? [];
          for (var message in messages) {
            final messageText = message.get("text");
            final messageSender = message.get("sender");

            // استخدم signedInUser?.email لتجنب الخطأ
            final currentUser = FirebaseAuth.instance.currentUser?.email ?? '';

            final messageWidget = messageline(
                sender: messageSender,
                text: messageText,
                isMe: currentUser == messageSender);

            messageWidgets.add(messageWidget);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        });
  }
}

class messageline extends StatelessWidget {
  final String? sender;
  final String? text;
  final bool isMe;
  const messageline(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              "$sender",
              style: const TextStyle(color: Colors.grey),
            ),
            Material(
              elevation: 8,
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: const Radius.circular(30),
                      bottomLeft: const Radius.circular(30),
                      bottomRight: const Radius.circular(30))
                  : const BorderRadius.only(
                      topRight: const Radius.circular(30),
                      bottomLeft: const Radius.circular(30),
                      bottomRight: const Radius.circular(30)),
              color: isMe
                  ? const Color.fromARGB(255, 10, 73, 13)
                  : const Color.fromARGB(255, 40, 38, 51),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("$text",
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
          ],
        ));
  }
}
