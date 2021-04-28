import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final ligthGrey = Color(0xFFBBBBBB);
  static final veryLigthGrey = Color(0xFF3F3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF56388);
}

final deliverygrandiant = [DeliveryColors.green, DeliveryColors.purple];
final _boderLigth = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DeliveryColors.veryLigthGrey,
    style: BorderStyle.solid,
    width: 2,
  ),
);
final _boderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DeliveryColors.grey,
    style: BorderStyle.solid,
    width: 2,
  ),
);

final _shadowDark = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: DeliveryColors.grey,
      blurRadius: 10,
    ),
  ],
);

final _shadowLigth = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: DeliveryColors.veryLigthGrey,
      blurRadius: 10,
    ),
  ],
);


//Asigno el color por medio del displayColor y apply
final ligthTheme = ThemeData(
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  bottomAppBarColor: DeliveryColors.veryLigthGrey,
  appBarTheme: AppBarTheme(
    color: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
        color: DeliveryColors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: DeliveryColors.purple,
    bodyColor: DeliveryColors.purple,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: _boderLigth,
    enabledBorder: _boderLigth,
    labelStyle: TextStyle(color: DeliveryColors.purple),
    focusedBorder: _boderLigth,
    contentPadding: EdgeInsets.zero,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.ligthGrey,
      fontSize: 12,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple,
  ),
);

final dartkTheme = ThemeData(
  canvasColor: DeliveryColors.grey,
  accentColor: DeliveryColors.white,
  bottomAppBarColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    color: DeliveryColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
        color: DeliveryColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  ),
  scaffoldBackgroundColor: DeliveryColors.dark,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: DeliveryColors.green,
    bodyColor: DeliveryColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: DeliveryColors.white),
    border: _boderDark,
    contentPadding: EdgeInsets.zero,
    enabledBorder: _boderDark,
    focusedBorder: _boderDark,
    fillColor: DeliveryColors.grey,
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.white,
      fontSize: 12,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.white,
  ),
);
//Asigno el color por medio del displayColor y apply

