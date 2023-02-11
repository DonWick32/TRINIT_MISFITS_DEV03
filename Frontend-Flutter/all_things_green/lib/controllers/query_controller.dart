import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  final queries = [].obs;
  final finalQueries = [].obs;
  final textController = TextEditingController();
  final searchController = TextEditingController();
  void upvote(int index) {
    queries[index]["upvotes"] += 1;
    finalQueries[index]["upvotes"] += 1;
    print(queries[index]["upvotes"]);
    update();
  }
  void search(String key){
    queries.clear();
    for (var i = 0; i < finalQueries.length; i++) {
      if(finalQueries[i]["text"].contains(key)){
        queries.add(finalQueries[i]);
      }
    }
    update();
  }
  void addCard(String text) {
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
  }
  void addReply(String text, int index) {
    queries[index]["replies"].add(text);
    finalQueries[index]["replies"].add(text);
    update();
  }
}