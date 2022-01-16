import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_with_dio/controller/UserController.dart';
import 'package:rest_api_with_dio/model/UserModel.dart';
import 'package:rest_api_with_dio/widgets/click_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController firstnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    UserController controller = UserController.to;

    onClearPressed() {
      firstnameController.clear();
      emailController.clear();
    }

    onAddPressed() {
      UserModel newUser = new UserModel(first_name: firstnameController.text, email: emailController.text);
      onClearPressed();
      controller.addUser(newUser);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest APIs with Dio & GetX'),
      ),
      body: Container(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const Text('User', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            TextField(
              controller: firstnameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClickButton(text: 'Add', onPressed: () => onAddPressed()),
                ClickButton(text: 'Update', onPressed: () {}),
                ClickButton(text: 'Clear', onPressed: () => onClearPressed()),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<UserController>(
              builder: (controller) {
                return Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.listUsers[index].first_name!),
                                        Text(controller.listUsers[index].email!),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                            ),
                        itemCount: controller.listUsers.length));
              }
            )
          ],
        ),
      ),
    );
  }
}
