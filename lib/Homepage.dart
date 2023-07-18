import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Color(0xFF04356D),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
            child: GNav(
              backgroundColor: Color(0xFF04356D),
              activeColor: Color(0xFF04356D),
              tabBackgroundColor: Color(0xFFF1F1E6),
              padding: EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(icon: Icons.home_filled,iconColor: Color(0xFFF1F1E6),text: 'Home', ),
                GButton(icon: Icons.event_note,iconColor: Color(0xFFF1F1E6),text: 'Log', ),
                GButton(icon: Icons.group_add,iconColor: Color(0xFFF1F1E6), text: 'Tally'),
                GButton(icon: Icons.group,iconColor: Color(0xFFF1F1E6),text: 'Team'),
                GButton(icon: Icons.message_outlined, iconColor:Color(0xFFF1F1E6),text: 'Chats'),
              ],
            ),
          ),
        ),
    );
  }
}
