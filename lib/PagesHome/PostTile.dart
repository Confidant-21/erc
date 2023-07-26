import 'package:flutter/material.dart';

class PostTile extends StatefulWidget {
  //const PostTile({super.key});
  final int index;

  PostTile({required this.index});

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFFF1F1E6),border: Border.all(color: Color(0xFF04356D))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:  Radius.circular(20)),
                    image: DecorationImage(image:AssetImage("assets/Images/Feed/3.png"),fit: BoxFit.cover)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt,color: Color(0xFF04356D),)),
                  Text("Post ${widget.index+1}",style: TextStyle(color: Color(0xFF04356D),fontSize: 20),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share),color: Color(0xFF04356D),),
                ],
              ),
              Text("This is a Description",style: TextStyle(color: Color(0xFF04356D),fontSize: 20),),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
