//Packages
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// Pages
import 'connecting.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dryve Hub',
      debugShowCheckedModeBanner: false,
			home: const ConnectingPage()
		);
	}
}
