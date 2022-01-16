import 'package:dio/dio.dart';
import 'package:rest_api_with_dio/api/client.dart';
import 'package:rest_api_with_dio/api/user_api.dart';
import 'package:rest_api_with_dio/model/UserModel.dart';

class UserRepository {
  Dio apiClient = Dio();

  UserRepository() {
    apiClient = client();
  }

  Future<List<UserModel>> fetchUserList(int page) async {
    Response response = await fetchAList(apiClient, page);
    print(response.data['data']);

    List<UserModel> listUsers = (response.data['data'] as List)
        .map((json) => UserModel.fromJson(json))
        .toList();

    return listUsers;
  }

  Future<UserModel> fetchUser(String userId) async {
    Response response = await fetchOne(apiClient, userId);
    UserModel user = UserModel.fromJson(response.data['data']);

    return user;
  }

  Future<UserModel> addUser(UserModel userModel) async {
    Response response = await createOne(apiClient, userModel.toJson());
    UserModel user = UserModel.fromJson(response.data);

    return user;
  }

  Future<Response> updateUser(String userId, UserModel userModel) async {
    return await updateOne(apiClient, userId, userModel.toJson());
  }

  Future<Response> deleteUser(String userId) async {
    return await deleteOne(apiClient, userId);
  }



}
