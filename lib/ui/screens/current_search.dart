import 'dart:convert';

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:find_anime/model/result.dart';
import 'package:find_anime/ui/screens/settings_screen.dart';
import 'package:find_anime/ui/widgets/result_card.dart';
import 'package:find_anime/ui/widgets/rounded_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:http/http.dart' as http;

class CurrentSearch extends StatefulWidget {
  static String routeName = '/search';

  @override
  _CurrentSearchState createState() => _CurrentSearchState();
}

class _CurrentSearchState extends State<CurrentSearch> {
  String urlSearchByUrl = 'https://trace.moe/api/search?url=';
  bool hasSearch = false;
  List<dynamic> _result = [];

  @override
  Widget build(BuildContext context) {
    DropzoneViewController controller;

    return Scaffold(
      appBar: AppBar(
        title: Text('SearchAnime'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              })
        ],
      ),
      body: Stack(
        children: [
          DropzoneView(
            onCreated: (ctrl) => controller = ctrl,
            onDrop: (thing) async {
              Uint8List droppedFile = await controller.getFileData(thing);
              String base64image = base64Encode(droppedFile);
              _searchByFile(base64image);
            },
          ),
          hasSearch ? _buildResult() : _buildTitle(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _newSearchByFile(),
              tooltip: 'Search by file',
              child: Icon(
                Icons.attach_file_outlined,
                color: Theme.of(context).accentColor,
              ), //Change Icon
            ),
          ),
          FloatingActionButton(

            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => _newSearchByUrl(),
            tooltip: 'Search by url',
            child: Icon(
              Icons.link_outlined,
              color: Theme.of(context).accentColor,
            ), //Change Icon
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    if (_result == null || _result.isEmpty) {
      return _buildLoading();
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _result.length,
              itemBuilder: (BuildContext context, int index) {
                return ResultCard(
                  result: Docs.fromJson(_result[index]),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildTitle() {
    return Center(
        child: Text(
      'Make new search to get info about anime',
      style: TextStyle(fontSize: 18),
    ));
  }

  Future<void> _newSearchByFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      Uint8List pickedFile = result.files.single.bytes;
      String base64image = base64Encode(pickedFile);
      _searchByFile(base64image);
    }
  }

  void _newSearchByUrl() {
    TextEditingController urlController = TextEditingController();

    roundedModalSheet(
        context,
        'New search',
        Column(
          children: [
            TextFormField(
              controller: urlController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Enter image url',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor))),
            ),
            ButtonBar(
              children: [
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  highlightColor:
                      Theme.of(context).accentColor.withOpacity(0.20),
                ),
                OutlineButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Search by url',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                  onPressed: () => _searchByUrl(urlController.text),
                  highlightedBorderColor: Theme.of(context).accentColor,
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ],
        ));
  }

  Future<void> _searchByUrl(String url) async {
    Navigator.pop(context);
    hasSearch = true;
    setState(() {});
    http.Response response = await http.get(urlSearchByUrl + url);
    if (response.statusCode == 200) {
      Map<String, dynamic> resultMap = jsonDecode(response.body);
      List<dynamic> data = resultMap["docs"];
      _result = data;
      setState(() {});
    } else {
      hasSearch = false;
      switch (response.statusCode) {
        case 400:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Image is empty')));
          break;
        case 429:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Too many request, please try later')));
          break;
        case 500:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Something went wrong on server')));
          break;
        case 503:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Something went wrong on server')));
          break;
        default:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong')));
          break;
      }
    }
  }

  Future<void> _searchByFile(String encodedImage) async {
    hasSearch = true;
    setState(() {});
    final http.Response response = await http.post(
      'https://trace.moe/api/search',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'image': encodedImage,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> resultMap = jsonDecode(response.body);
      List<dynamic> data = resultMap["docs"];
      _result = data;
      setState(() {});
    } else {
      hasSearch = false;
      switch (response.statusCode) {
        case 400:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Image is empty')));
          break;
        case 429:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Too many request, please try later')));
          break;
        case 500:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Something went wrong on server')));
          break;
        case 503:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Something went wrong on server')));
          break;
        default:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong')));
          break;
      }
    }
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
