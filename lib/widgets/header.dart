import 'package:flutter/material.dart';
import 'package:flutter_icomoon_icons/flutter_icomoon_icons.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/provider/theme.dart';
import 'package:proyecto_takingnotes/utils/theme.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool theme = true;
    ThemeProvider _mytheme = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 26, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      "Mis Deudores",
                      style: Theme.of(context).textTheme.overline.copyWith(
                            color: Theme.of(context).accentColor,
                            fontSize: 25,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Switch(
                      value: theme,
                      onChanged: (value) {
                        print("Cambiando de tema");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
