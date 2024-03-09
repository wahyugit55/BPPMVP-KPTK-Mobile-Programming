import 'package:flutter/material.dart';
import 'package:resting/api_service.dart';
import 'package:resting/user_model.dart';
import 'package:resting/user_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<UserModel>? userModel = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    userModel = await ApiService().getUsers();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Daftar User',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        body: userModel == null || userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(Icons.person, color: Colors.blue),
                    ),
                    title: Text(userModel![index].name),
                    subtitle: Text(userModel![index].email),
                    onTap: () {
                      // Navigasi ke halaman detail user
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserDetailPage(user: userModel![index])),
                      );
                    },
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0), // Menyesuaikan jarak kiri dan kanan
                  );
                },
              ),
      ),
    );
  }
}
