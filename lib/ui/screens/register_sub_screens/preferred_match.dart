import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class PrefPotentialMatches extends StatefulWidget
{
  final Function(String) onChanged;

  PrefPotentialMatches({
    @required this.onChanged
  });

  @override
  _PrefPotentialMatches createState() => _PrefPotentialMatches();
}

class _PrefPotentialMatches extends State<PrefPotentialMatches>
{
  final List<String> options = ["Male", "Female", "Both"];

  @override
  Widget build(BuildContext context)
  {
    String select = "";
    Map<int, String> mappedOptions = options.asMap();

    return StatefulBuilder(
        builder: (_, StateSetter setState) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Would you like to match with: ",
              style: Theme.of(context).textTheme.headline4,
            ),
            ...mappedOptions.entries.map(
                    (MapEntry<int, String> mapEntry) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    Theme
                      (
                      data: ThemeData.dark(),
                      child: Radio(
                        activeColor: kAccentColor,
                        groupValue: select,
                        value: options[mapEntry.key],
                        onChanged: (value) => {
                          setState(() {print(select);select=value.toString();}),
                          widget.onChanged(value.toString())
                        },
                      ),
                    ),
                    Text(
                      mapEntry.value,
                      style: kTextTheme.bodyText2,
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}

