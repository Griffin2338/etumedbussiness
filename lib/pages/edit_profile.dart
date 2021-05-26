import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditProfilePage extends StatefulWidget {
  /// The page title.
  final String title = 'Edit Profile';

  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              height: 250,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 140,
                              height: 140,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ibb.co/N7vn6QZ/indir.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 90, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 25,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    ]),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Personal Information',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller:
                                    TextEditingController(text: 'Mesut Ozil'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Location',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: TextEditingController(
                                    text: 'Istanbul, Turkey'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Job',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: TextEditingController(
                                    text: 'Software Developer at SuperGame LLC.'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'University',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: TextEditingController(
                                    text: 'University of Berlin'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Professional',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: TextEditingController(
                                    text: 'Softwares'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'E-Mail',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 2),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: TextEditingController(
                                    text: 'mesut.ozil@mail.com'),
                                decoration: const InputDecoration(
                                  hintText: 'Your Name',
                                ),
                                enabled: true,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: (){

                                  },
                                  shape:  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Ink(
                                    child: Container(
                                      constraints: const BoxConstraints(maxWidth: 100,maxHeight: 40,),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Save Changes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
