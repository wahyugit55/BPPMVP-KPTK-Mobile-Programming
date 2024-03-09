import 'package:flutter/material.dart';
import 'user_model.dart'; // Asumsikan ini adalah path yang benar untuk model user Anda

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60, // Atur sesuai kebutuhan
              backgroundColor: Colors.blue.shade100,
              child: Text(
                user.name[0], // Gunakan inisial nama user
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            ProfileSection(title: "Username", content: user.username),
            Divider(),
            ProfileSection(title: "Email", content: user.email),
            Divider(),
            ProfileSection(title: "Phone", content: user.phone),
            Divider(),
            ProfileSection(title: "Website", content: user.website),
            Divider(),
            ProfileSection(
                title: "Address",
                content:
                    "${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}"),
            Divider(),
            ProfileSection(
                title: "Company",
                content:
                    "${user.company.name}\n${user.company.catchPhrase}\n${user.company.bs}"),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final String content;

  const ProfileSection({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 5),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
