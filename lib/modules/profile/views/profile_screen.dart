import 'package:flutter/material.dart';
import 'package:movie_application/common/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profilScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Detail",
          style: myTextTheme.headline4,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwc8Aeo9ht0d8ZVmptynyejV3gsL-T6CwNHQ&usqp=CAU",
                    fit: BoxFit.fill,
                  ),
                ),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 1.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: const SizedBox(
                            height: 45,
                          ),
                        ),
                        const CircleAvatar(
                          radius: 80,
                          backgroundColor: neutral300,
                          backgroundImage: NetworkImage(
                              "https://i.ibb.co/rySscH5/3-x-4-new-blue-min-1.jpg"),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.06),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'FullName',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: const Text(
                      "Muhamad Irwan Ramadhan",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const Text(
                      'Username',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: const Text(
                      "muhamadirwan99",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: const Text(
                      "muhamadirwan99@gmail.com",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const Divider(color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
