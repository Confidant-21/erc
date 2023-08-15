import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snackbar/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
XFile? _pickedImage;

class _AddPostState extends State<AddPost> {
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _uploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  Future<void> storeImageDownloadUrl(String imageUrl) async {
    FirebaseApp app = await Firebase.initializeApp();
    if (imageUrl != Null && _descriptionController != Null) {
      await FirebaseFirestore.instance.collection('images').add({
        'image_url': imageUrl,
        'description': _descriptionController.text,
        'likes' : 0,
        // Other data fields you might want to store
      });
    }
  }


  Future<String> _getImageDownloadUrl(String imagePath) async {
    FirebaseApp app = await Firebase.initializeApp();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$imagePath');
    String downloadURL = await storageReference.getDownloadURL();
    return downloadURL;
  }

  Future<void> _uploadImagetoFirestore() async {
  
    if (_pickedImage != Null) {
      showDialog(context: context, builder: (context) {
        return Center(child: CircularProgressIndicator(color: Color(0xFF04356D),));
      },);
      final _pathInDevice = 'ERC Feed/${_pickedImage!.path}';
      final file = File(_pickedImage!.path);

      final ref = FirebaseStorage.instance.ref().child(_pathInDevice);
      ref.putFile(file);
      String _URLPath = await _getImageDownloadUrl(_pathInDevice);
      print(_URLPath);
      await storeImageDownloadUrl(_URLPath);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }

  void _showImageBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Color(0xFF04356D),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1F1E6)),
                borderRadius: BorderRadius.circular(30),
              ),
              //color: Color(0xFFF1F1E6) ,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        image: FileImage(File(_pickedImage!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _descriptionController.text,
                    style: TextStyle(
                      color: Color(0xFFF1F1E6),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF7700)),
                      onPressed: _uploadImagetoFirestore,
                      child: Text(
                        "POST",
                        style:
                            TextStyle(color: Color(0xFFF1F1E6), fontSize: 23),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
                TextButton(
                    onPressed: () async {
                      if (_pickedImage != null) {
                        _showImageBottomSheet();
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Container(
                                height: 200,
                                width: 200,
                                color: Colors.yellow,
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "POST",
                        style:
                            TextStyle(color: Color(0xFFFF7700), fontSize: 23),
                      ),
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
                        style:
                            TextStyle(color: Color(0xFFF1F1E6), fontSize: 17),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        "Add a Description to your Post!",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      TextField(
                        //cursorWidth: 20,
                        decoration: InputDecoration(
                            hintText: 'Add Description',
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0),
                                borderRadius: BorderRadius.circular(25))),

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
