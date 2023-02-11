import 'package:all_things_green/controllers/query_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryPage extends GetView<QueryController> {

  const QueryPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    controller.getUserType();
    controller.getQueries();
    return GetBuilder<QueryController>(builder: ((controller){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller.textController,
              decoration: const InputDecoration(
                hintText: "Enter your query",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("Post"),
            onPressed: () {
              controller.addCard(controller.textController.text);
              controller.textController.clear();
            },
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: ((value) => controller.search(controller.searchController.text)),
              controller: controller.searchController,
              decoration: const InputDecoration(
                hintText: "Search query",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              child: const Text("Clear"),
              onPressed: () {
                controller.searchController.clear();
                controller.search("");
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.queries.length,
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
                                controller.queries[index]['text'],
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
                                    onPressed: (() => controller.upvote(index)),
                                  ),
                                  Text("${controller.queries[index]['upvotes']} upvotes"),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(Icons.reply),
                                    onPressed: () {
                                      showReplyDialog(context, index);
                                    },
                                  ),
                                ],
                              ),
Row(
  children: [
    Text("Replies: "),
    controller.queries[index]['replies'].length == 0 ? Text("No replies yet") :
    ElevatedButton(
      child: Text("View Replies"),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Replies"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: controller.queries[index]['replies'].map<Padding>((reply) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(reply),
                    )),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    ),
  ],
)

                            ],
                          ),
                        ),
                      ),



                      // ...controller.queries[index]['replies'].map((reply) {
                      //   return Container(
                      //     margin: const EdgeInsets.only(left: 50),
                      //     child: Card(
                      //       margin: const EdgeInsets.all(10),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Text(reply),
                      //       ),
                      //     ),
                      //   );
                      // }).toList(),
                      
//                       Row(
//                         children: [
//                           Text("Replies: "),
//                           DropdownButton(
//   value: controller.queries[index]['replies'][0],
//   items: controller.queries[index]['replies'].map<DropdownMenuItem<dynamic>>((reply) {
//     return DropdownMenuItem(
//       value: reply,
//       child: Text(reply),
//     );
//   }).toList() as List<DropdownMenuItem<dynamic>>,
//   onChanged: (selectedReply) {
//     // do something with selectedReply
//   },
// ),
//                         ],
//                       )


                    ],
                  );
              },
            ),
          ),
        ],
      ),
    );}));
  }


  

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
                  controller: controller.replyController,
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
                        controller.addReply(controller.replyController.text, index);
                        controller.replyController.clear();
                        Navigator.pop(context);
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
