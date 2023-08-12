import 'package:erc/PagesHome/AddPost.dart';
import 'package:erc/PagesHome/PostTile.dart';
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
        backgroundColor: Colors.transparent,
        // Color(0xFFF1F1E6),
        // floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {}, label: Icon(Icons.add_photo_alternate_outlined,color: Color(0xFF04356D),weight: double.maxFinite),backgroundColor: Colors.transparent),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    height: 50,
                    child: Center(
                        child: Text(
                      "Our Social Feed",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Times New Roman',
                        color: Color(0xFF04356D),
                      ),
                    )),
                    // color: Color(0xFFF1F1E6),
                    decoration: BoxDecoration(
                        color: Color(0xFFF1F1E6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    width: MediaQuery.of(context).size.width,
                  )),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.pending_rounded,
                      color: Color(0xFFF1F1E6),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF04356D),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: Text(
                      'Setting',
                      style: TextStyle(color: Color(0xFFF1F1E6)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPost(),
                          ));
                    },
                    icon: Icon(
                      Icons.add_photo_alternate_rounded,
                      color: Color(0xFFF1F1E6),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF04356D),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: Text(
                      'Add Post',
                      style: TextStyle(color: Color(0xFFF1F1E6)),
                    ),
                  ),
                ],
              ),
              expandedHeight: (MediaQuery.of(context).size.height) * 0.5,
              backgroundColor: Color(0xFFF1F1E6),
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/Images/Feed/logo.png",
                    width: MediaQuery.of(context).size.width*0.8,
                    //fit: BoxFit.cover
    ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PostTile(
                  index: index,
                );
              },
              childCount: 10, // Replace this with your desired item count
            ))
          ],
        ));
  }
}
