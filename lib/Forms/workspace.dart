import 'package:flutter/material.dart';

import '../Design/custom_shape.dart';
import 'form_widget.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key key}) : super(key: key);

  @override
  State<Workspace> createState() => WorkspaceState();
}

class WorkspaceState extends State<Workspace> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text('Activity Details',
              style: TextStyle(color: Colors.black))),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 140,
                  right: 8,
                  height: 600,
                  child: Container(
                      alignment: Alignment.center,
                      width: 360,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                              height: 650,
                              width: double.infinity,
                              child: const FormWidget()),
                          // if (isLoading)
                          //   Container(
                          //     alignment: Alignment.bottomCenter,
                          //     child: ElevatedButton(
                          //       style: ButtonStyle(
                          //           backgroundColor:
                          //               MaterialStateProperty.all<Color>(
                          //                   Colors.green)),
                          //       onPressed: () async {
                          //         setState(() {
                          //           isLoading = false;
                          //         });
                          //         await FormWidgetState().submitResult();
                          //         if (!mounted) return;
                          //         setState(() {
                          //           isLoading = true;
                          //         });
                          //         // Navigator.of(context).pop();
                          //       },
                          //       child: const Text('Submit',
                          //           style: TextStyle(color: Colors.white)),
                          //     ),
                          //   )
                          // else
                          //   const Center(
                          //       child: CircularProgressIndicator(
                          //           backgroundColor:
                          //               Color.fromRGBO(0, 161, 39, 1)))
                        ],
                      )),
                ),
              ])),
        ],
      ),
    );
  }
}

// showAlertDialog(BuildContext context) {
//   Widget okButton = TextButton(
//       child: const Text('OK',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//       onPressed: () => {
//             Navigator.pushNamed(context, 'workspace'),
//           });

//   AlertDialog alert = AlertDialog(
//     title: const Text('Password Reset'),
//     backgroundColor: Colors.grey[400],
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//         side: const BorderSide(color: Colors.black)),
//     content: const FormWidget(),
//     actions: [
//       okButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
