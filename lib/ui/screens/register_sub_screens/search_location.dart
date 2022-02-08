import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tinder_app_flutter/ui/screens/register_sub_screens/address_search.dart';
import 'package:tinder_app_flutter/ui/screens/register_sub_screens/place_service.dart';
import 'package:tinder_app_flutter/util/api_key.dart';
import 'package:uuid/uuid.dart';

class SearchLocationPage extends StatefulWidget {

  final Function(String) onLocationChanged;

  SearchLocationPage({
    @required this.onLocationChanged
  });

  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();

}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final _controller = TextEditingController();
  String location;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farts"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              readOnly: true,
              onTap: () async {
                // generate a new token here
                final sessionToken = Uuid().v4();
                final Suggestion result = await showSearch(
                  context: context,
                  delegate: AddressSearch(sessionToken),
                );

                if (result != null) {
                  final client = Client();
                  String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=${result.placeId}&fields=geometry&key=$API_KEY';
                  final response = await client.get(url);
                  String loc = jsonDecode(response.body)['result']['geometry']['location'].toString();
                  setState(() {
                    location = loc;
                    widget.onLocationChanged(location);
                    _controller.text = result.description;
                  });
                }
              },
              decoration: InputDecoration(
                icon: Container(
                  width: 10,
                  height: 5,
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
                hintText: "Enter your shipping address",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8.0, top: 5.0),
              ),
            ),
            SizedBox(height: 5.0),
            Text('Street Number: '),
          ],
        ),
      ),
    );
  }
}