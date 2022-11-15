import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mne/Forms/form_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Network/api.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  // to show error message

  _showScaffold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.black)),
        duration: const Duration(seconds: 20),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Press to go back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.redAccent));
  }

  final List<FormModel> _formfields = [];
  var loading = false;
  var isEmpty = false;
  List activityResponses = [];
  late Map<String, List<dynamic>> data;

// to fetch form fields
  fetchFormFields() async {
    setState(() {
      loading = true;
    });

    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var saved = localStorage.getString('activitytask_id');

    var res = await Network().getData('mobile/activity-fields/$saved');

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final tdata = data['data'];
      if (tdata.length == 0) {
        Navigator.of(context).pushReplacementNamed('error');
      }

      var formfieldsJson = tdata;

      setState(() {
        for (Map formfieldJson in formfieldsJson) {
          _formfields.add(FormModel.fromJson(formfieldJson));
        }
        loading = false;
      });
    }
  }

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchFormFields();
  }

  submitResult() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final String? responseData = localStorage.getString('responses');
    final String responseList = json.decode(responseData!);
    final List responseList2 = [responseList];

    debugPrint(responseList.toString());
    data = {"activity_responses": responseList2};
    var res = await Network().authData(data, 'mobile/activity-result');

    if (res.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('activitytasks');
    } else {
      Navigator.of(context).pushReplacementNamed('error');
    }
    return;
  }

  @override
  void dispose() {
    _textController.dispose();
    _numberController2.dispose();

    super.dispose();
  }

  bool isLoading = true;

  // to display form fields
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _formfields.length,
                    itemBuilder: (context, i) {
                      final nDataList = _formfields[i];

                      return Form(
                        child: Column(children: [
                          Column(children: [
                            if (nDataList.type == 'text')
                              Column(children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(bottom: 5, left: 6),
                                  child: Text('Add a ${nDataList.name}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: _textController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: const OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          labelText: nDataList.name),
                                    )),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green)),
                                    onPressed: () async {
                                      var responseData = {
                                        "activity_field_id": nDataList.id,
                                        "value": _textController.text
                                      };
                                      activityResponses.add(responseData);
                                      debugPrint(activityResponses.toString());
                                    },
                                    child: const Text('Save',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ]),
                            if (nDataList.type == 'number')
                              Column(children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                      bottom: 5, left: 6, top: 5),
                                  child: Text('Add a ${nDataList.name}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: _numberController2,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: const OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          labelText: nDataList.name),
                                    )),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green)),
                                    onPressed: () async {
                                      // valueResponses.add(_numberController2.text);
                                      // idResponses.add(nDataList.id);
                                      var numberData = {
                                        "activity_field_id": nDataList.id,
                                        "value": _numberController2.text
                                      };
                                      activityResponses.add(numberData);
                                      debugPrint(activityResponses.toString());

                                      SharedPreferences localStorage =
                                          await SharedPreferences.getInstance();

                                      final String encodedData =
                                          (activityResponses)
                                              .asMap()
                                              .toString();
                                      final String encodedData2 =
                                          jsonEncode(encodedData);
                                      localStorage.setString(
                                          'responses', encodedData2);
                                    },
                                    child: const Text('Save',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                if (isLoading)
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.green)),
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        await submitResult();
                                        if (!mounted) return;
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // Navigator.of(context).pop();
                                      },
                                      child: const Text('Submit',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  )
                                else
                                  const Center(
                                      child: CircularProgressIndicator(
                                          backgroundColor:
                                              Color.fromRGBO(0, 161, 39, 1)))
                              ]),
                          ]),
                        ]),
                      );
                    })));
  }
}
