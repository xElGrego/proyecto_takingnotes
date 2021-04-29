import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/provider/theme.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
            style: BorderStyle.solid,
            color: Theme.of(context).accentColor,
          ),
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
                      "Listado",
                      style: Theme.of(context).textTheme.overline.copyWith(
                            color: Theme.of(context).accentColor,
                            fontSize: 25,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Consumer<ThemeProvider>(
                      builder: (context, notifier, child) => Switch(
                        value: notifier.darktheme,
                        onChanged: (value) {
                          notifier.toogleTheme();
                        },
                      ),
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
