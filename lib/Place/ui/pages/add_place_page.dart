import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_avanzado/Place/models/place.dart';
import 'package:platzi_avanzado/Place/ui/widgets/card_image.dart';
import 'package:platzi_avanzado/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_avanzado/widgets/button_purple.dart';
import 'package:platzi_avanzado/widgets/gradient_back.dart';
import 'package:platzi_avanzado/widgets/text_input.dart';
import 'package:platzi_avanzado/widgets/title_header.dart';

class AddPlacePage extends StatefulWidget {
  File img;

  AddPlacePage({
    Key key,
    this.img,
  }) : super(key: key);

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final _titleTextCtrl = TextEditingController();
    final _descriptionTextCtrl = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: 300.00,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(
                    title: 'Add a new Place',
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFABIcon(
                    pathImage: widget.img.path,
                    icon: Icons.camera,
                    height: 250.0,
                    width: 350.0,
                    left: 0,
                    onPressedFABIcon: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: 'Title',
                    inputType: null,
                    textCtrl: _titleTextCtrl,
                    maxlines: 1,
                  ),
                ),
                TextInput(
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  textCtrl: _descriptionTextCtrl,
                  maxlines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hinText: 'Location...',
                    icon: Icons.location_on,
                    textCtrl: null,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                      buttonText: "Add Place",
                      onPressed: () async {
                        // TODO: FirebaseStorage
                        // URL
                        var userC = userBloc.currentUser;
                        if (userC != null) {
                          String uid = userC.uid;
                          String path = "${uid}/${DateTime.now().toIso8601String()}.jpg";

                          // Upload file
                          userBloc
                              .uploadFile(path, widget.img)
                              .then((takeSnashot) => {
                                    takeSnashot.ref
                                        .getDownloadURL()
                                        .then((urlPlace) {
                                      userBloc
                                          .updatePlaceDataCloudFirestore(Place(
                                        name: _titleTextCtrl.text,
                                        description: _descriptionTextCtrl.text,
                                        urlImg: urlPlace,
                                        likes: 0,
                                      ))
                                          .whenComplete(() {
                                        print("Termino la subida de data");
                                        Navigator.pop(context);
                                      });
                                    })
                                  });

                          // userBloc
                          //     .uploadFile(path, widget.img)
                          //     .then((takeSnashot) => {
                          //           takeSnashot.ref
                          //               .getDownloadURL()
                          //               .then((urlPlace) {
                          //             userBloc
                          //                 .updatePlaceDataCloudFirestore(Place(
                          //               name: _titleTextCtrl.text,
                          //               description: _descriptionTextCtrl.text,
                          //               urlImg: urlPlace,
                          //               likes: 0,
                          //             ))
                          //                 .whenComplete(() {
                          //               print("Termino la subida de data");
                          //               Navigator.pop(context);
                          //             });
                          //           })
                          //         });
                          // userBloc
                          //     .uploadFile(path, widget.img)
                          //     .then((UploadTask value) async {
                          //   value.snapshotEvents.listen(
                          //       (TaskSnapshot snapshot) {
                          //     print('Task state: ${snapshot.state}');
                          //     print(
                          //         'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
                          //   }, onError: (e) {
                          //     // The final snapshot is also available on the task via `.snapshot`,
                          //     // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
                          //     print(value.snapshot);

                          //     if (e.code == 'permission-denied') {
                          //       print(
                          //           'User does not have permission to upload to this reference.');
                          //     }
                          //   });

                          //   // We can still optionally use the Future alongside the stream.
                          //   try {
                          //     await value;
                          //     print('Upload complete.');
                          //     //value.snapshot
                          //     value.snapshot.ref.getDownloadURL().then((urlImg) {
                          //     print('URL en firebase${urlImg}');
                          //     // Cloud Firestore
                          //     userBloc
                          //         .updatePlaceDataCloudFirestore(Place(
                          //       name: _titleTextCtrl.text,
                          //       description: _descriptionTextCtrl.text,
                          //       likes: 0,
                          //       urlImg: urlImg,
                          //     ))
                          //         .whenComplete(() {
                          //       print("Termino");
                          //       Navigator.pop(context); // Regresa una pag
                          //     });
                          //   });

                          //   } on FirebaseException catch (e) {
                          //     if (e.code == 'permission-denied') {
                          //       print(
                          //           'User does not have permission to upload to this reference.');
                          //     }
                          //     // ...
                          //   }

                          // }).catchError((onError) => print('ERROR> $onError'));
                        }

                        // Obj Place
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
