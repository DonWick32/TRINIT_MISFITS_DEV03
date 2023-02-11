import 'package:all_things_green/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';


class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeUser(int userID) async {
    await storage.write(StorageConstants.userID, userID);
  }

  int? getUser() {
    if (storage.read(StorageConstants.userID) == null) {
      return null;
    }
    return storage.read(StorageConstants.userID);
  }
  Future<void> storeUserType(String userType) async {
    await storage.write(StorageConstants.userType, userType);
  }

  String? getUserType() {
    if (storage.read(StorageConstants.userType) == null) {
      return null;
    }
    return storage.read(StorageConstants.userType);
  }
}