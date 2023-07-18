import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "Account",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Icon(Icons.home),
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
