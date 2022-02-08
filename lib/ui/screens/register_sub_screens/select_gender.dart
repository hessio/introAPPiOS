import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class SelectGender extends StatefulWidget
{

  final Function(String) onChanged;

  SelectGender({
    @required this.onChanged
  });

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  final List<String> genderList = ["Male", "Female", "Other"];
  @override
  Widget build(BuildContext context) {
    String select = "";
    Map<int, String> mappedGender = genderList.asMap();

    return StatefulBuilder(
      builder: (_, StateSetter setState) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Gender : ',
            style: Theme.of(context).textTheme.headline3,
          ),
          ...mappedGender.entries.map(
                (MapEntry<int, String> mapEntry) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: ThemeData.dark(),
                    child: Radio(
                      activeColor: kAccentColor,
                      groupValue: select,
                      value: genderList[mapEntry.key],
                      onChanged: (value) => {
                        setState(() {
                          select = value.toString();}),
                          widget.onChanged(value.toString())
                      },
                    ),
                  ),
                  Text(mapEntry.value,
                    style: kTextTheme.bodyText2,)
                ]),
          ),
        ],
      ),
    );
  }
}
