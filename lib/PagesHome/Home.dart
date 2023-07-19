import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, // Color(0xFFF1F1E6),
        // floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {}, label: Icon(Icons.add_photo_alternate_outlined,color: Color(0xFF04356D),weight: double.maxFinite),backgroundColor: Colors.transparent),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_photo_alternate_rounded),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: Text('Add Post'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.settings_accessibility_outlined),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: Text('Settings'),
                  )
                ],
              ),
              expandedHeight: (MediaQuery.of(context).size.height) * 0.5,
              backgroundColor: Color(0xFFF1F1E6),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/Images/Feed/homemain.png",
                    width: double.maxFinite, fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  color: Color(0xFFF1F1E6),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  width: 300,
                  color: Color(0xFFF1F1E6),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  width: 300,
                  color: Color(0xFF04356D),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  color: Color(0xFF04356D),
                ),
              ),
            )
          ],
        ));
  }
}
