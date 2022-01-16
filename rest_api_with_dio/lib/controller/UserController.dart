import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:rest_api_with_dio/model/UserModel.dart';
import 'package:rest_api_with_dio/repository/user_repository.dart';

class UserController extends GetxController {
  List<UserModel> listUsers = [];
  UserModel selectedUser = UserModel();
  UserRepository repository = UserRepository();

  static UserController get to => Get.find<UserController>();

  Future fetchUserList(int page) async {
    listUsers = await repository.fetchUserList(page);
    update();
  }

  Future addUser(UserModel user) async {
    UserModel newUser = await repository.addUser(user);
    listUsers.add(newUser);
  }

  Future deleteUser(String userId) async {
    await repository.deleteUser(userId);
    listUsers.removeWhere((e) => e.id == userId);
    update();
  }

  Future updateUser(String userId, UserModel user) async {
    Response response = await repository.updateUser(userId, user);
    int index = listUsers.indexWhere((e) => e.id == userId);
    listUsers[index] = UserModel.fromJson(response.data);
    update();
  }

  setSelectedUser(UserModel user) {
    selectedUser = user;
    update();
  }
}
