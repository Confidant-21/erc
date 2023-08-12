import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snackbar/snackbar.dart';



class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> _uploadImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (image != null) {

    //_scaffoldKey.currentState!.showSnackBar(
    //   SnackBar(
    //     content: Text('Image uploaded successfully!'),
    //     duration: Duration(seconds: 2), // Optional duration
     // ),
    // );

  }
}

class _AddPostState extends State<AddPost> {
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              backgroundColor: Color(0xFF04356D),
              actions: [
                TextButton(onPressed: (){}, child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("POST",style: TextStyle(
                    color: Color(0xFFFF7700),fontSize: 23
                  ),),
                ))
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                    child: SvgPicture.asset(
                  "assets/Images/Feed/file.svg",
                  color: Color(0xFFF1F1E6),
                  width: 150,
                  height: 150,
                  // height: MediaQuery.sizeOf(context).height * 0.5,
                )),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: _uploadImage,
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Color(0xFFF1F1E6),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.05),
                          backgroundColor: Color(0xFFFF7700),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      label: Text(
                        'Upload Picture',
                        style: TextStyle(color: Color(0xFFF1F1E6),fontSize: 17),
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xFF04356D), Color(0xFFF1F1E6)],
                    stops: [0.5, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
              )),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF1F1E6),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Text("Add a Description to your Post!",style: TextStyle(fontSize: 30),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      TextField(
                        //cursorWidth: 20,
                        decoration: InputDecoration(hintText: 'Add Description',
                            contentPadding: EdgeInsets.all(20),border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(25)
                        )),

                        controller: _descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
