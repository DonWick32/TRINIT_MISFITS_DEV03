
import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late String _message;

  void _showReplyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter your message"),
          content: TextField(
            onChanged: (value) {
              _message = value;
            },
          ),
          actions: [
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Reply"),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // ignore: sort_child_properties_last
        child: CommentTreeWidget<Comment, Comment>(
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'felangel made felangel/cubit_and_beyond public '),
          [
            Comment(
                avatar: 'null',
                userName: 'null',
                content: 'A Dart template generator which helps teams'),
            Comment(
                avatar: 'null',
                userName: 'null',
                content:
                    'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
            Comment(
                avatar: 'null',
                userName: 'null',
                content: 'A Dart template generator which helps teams'),
            Comment(
                avatar: 'null',
                userName: 'null',
                content:
                    'A Dart template generator which helps teams generator which helps teams '),
          ],
          treeThemeData:
              TreeThemeData(lineColor: Colors.green[500]!, lineWidth: 3),
          avatarRoot: (context, data) => const PreferredSize(
            preferredSize: Size.fromRadius(18),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar_2.png'),
            ),
          ),
          avatarChild: (context, data) => const PreferredSize(
            preferredSize: Size.fromRadius(12),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar_1.png'),
            ),
          ),
          contentChild: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'dangngocduc',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 8,
                        ),
                        Text('Like'),
                        SizedBox(
                          width: 24,
                        ),
                        Text('Reply'),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          contentRoot: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'dangngocduc',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 8,
                        ),
                        Text('Like'),
                        SizedBox(
                          width: 24,
                        ),
                        Text('Reply'),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
