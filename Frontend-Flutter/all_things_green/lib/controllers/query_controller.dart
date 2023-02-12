import 'package:all_things_green/services/api_services.dart';
import 'package:all_things_green/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  final queries = [].obs;
  final finalQueries = [].obs;
  final textController = TextEditingController();
  final searchController = TextEditingController();
  final replyController = TextEditingController();
  final storage = Get.find<StorageServices>();
  final api = Get.find<ApiServices>().api;
  final type = ''.obs;

  void getQueries() async {
    queries.clear();
    finalQueries.clear();
    update();
    api.getQueries().then((value) => {
      for (int i = 0; i < value.length; i++)
        {
          queries.add({
            "text": value[i]["query_string"],
            "upvotes": 0,
            "replies": []
          }),
          finalQueries.add({
            "text": value[i]["query_string"],
            "upvotes": 0,
            "replies": []
          })
        },
        update()
    }, onError: (err) {
      Get.snackbar("Error", "Unable to fetch queries.");
      print(err);
    });
  }

  void upvote(int index) {
    queries[index]["upvotes"] += 1;
    finalQueries[index]["upvotes"] += 1;
    print(queries[index]["upvotes"]);
    update();
  }
  void search(String key){
    print("Welcome");
    queries.clear();
    update();
    print(finalQueries);
    for (var i = 0; i < finalQueries.length; i++) {
      if(finalQueries[i]["text"].contains(key)){
        queries.add(finalQueries[i]);
      }
    }
    print('Done');
    update();
  }
  void addCard(String text) async {
      
      api.postQuery(text).then((value) {
        if (value == "Query created successfully"){
          queries.add({
          "text": text,
          "upvotes": 0,
          "replies": []
        });
        finalQueries.add({
          "text": text,
          "upvotes": 0,
          "replies": []
        });
        update();
          Get.snackbar("Success", value);
        }
      }, onError: (err) {
        print(err);
        Get.snackbar("Failure", err.toString());
      });
  }
  void addReply(String text, int index) {
    queries[index]["replies"].add(text);
    finalQueries[index]["replies"].add(text);
    update();
  }
  void getUserType () async {
    String? userType = await storage.getUserType();
    type.value = userType!;
    // Get.snackbar("Type", type.value);
  }
}