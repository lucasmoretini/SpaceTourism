import 'package:flutter/material.dart';

const _primarySwatch = Colors.purple;
const _secondarySwatch = Color.fromARGB(255, 255, 255, 255);

ThemeData lightTheme = ThemeData(
	brightness: Brightness.light,
	primarySwatch: _primarySwatch,
	elevatedButtonTheme: ElevatedButtonThemeData(
		style: ElevatedButton.styleFrom(
			primary: Colors.white,
			onPrimary: Colors.black,
		)
	),
	
	appBarTheme: const AppBarTheme(
		titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
		backgroundColor: Colors.black,
		iconTheme: IconThemeData(color: Colors.white)
	),

	inputDecorationTheme: InputDecorationTheme(
		border: OutlineInputBorder(),
		focusedBorder: OutlineInputBorder(
			borderSide: BorderSide(color: Colors.black),
			borderRadius: BorderRadius.circular(20)
		)
	)
);

ThemeData dartTheme = ThemeData(
	brightness: Brightness.dark,
	primarySwatch: _primarySwatch,
	elevatedButtonTheme: ElevatedButtonThemeData(
		style: ElevatedButton.styleFrom(
			primary: Colors.black,
			onPrimary: Colors.purple,
		)
	)
);
