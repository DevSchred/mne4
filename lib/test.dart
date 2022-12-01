import 'package:flutter/material.dart';
import 'package:mne/Forms/form_widget.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (_isLoading)
        Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                child: const Text('Add Form'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('projects');
                  //   setState(() {
                  //     _isLoading = false;
                  //   });
                  //   await Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const CreateForm()));
                  //   if (!mounted) return;
                  //   setState(() {
                  //     _isLoading = true;
                  //   });
                  // },
                }))
      else
        const Center(
          child: CircularProgressIndicator(
              backgroundColor: Color.fromRGBO(0, 161, 39, 1)),
        )
    ]));
  }
}
