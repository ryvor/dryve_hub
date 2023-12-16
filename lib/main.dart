//Packages
import 'package:flutter/material.dart';

// Pages
import 'home.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Dryve Hub',
			home: const MyHomePage(title: 'Home'),
				theme: ThemeData(colorScheme: ColorScheme.fromSeed(
					seedColor: const Color.fromRGBO(40, 40, 40, 255),
					brightness: Brightness.dark,
				),
			),
		);
	}
}
