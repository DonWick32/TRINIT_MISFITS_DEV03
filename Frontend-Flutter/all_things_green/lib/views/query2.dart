import 'package:flutter/material.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  List<String> cardText = [];
  int upvotes = 0;
  final textController = TextEditingController();

  void addCard(String text) {
    setState(() {
      cardText.add(text);
    });
  }

  void upvote() {
    setState(() {
      upvotes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Enter your query",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("Submit"),
            onPressed: () {
              addCard(textController.text);
              textController.clear();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardText.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cardText[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.thumb_up),
                                  onPressed: upvote,
                                ),
                                Text("$upvotes upvotes"),
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(Icons.reply),
                                  onPressed: () {
                                    showReplyDialog(context, index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ...replies.map((reply) {
                      return Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(reply),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  List<String> replies = [];

 void showReplyDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Reply"),
          content: Container(
            height: 200,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Enter your reply",
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      setState(() {
                        replies.add(textController.text);
                        textController.clear();
                        Navigator.pop(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
