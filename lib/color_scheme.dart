// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class CustomScheme {
  Background background = Background();
  Foreground foreground = Foreground();
  Texts text = Texts();
}

class Background extends Functions {
	Color get main => hexToColor('#021942'); // Background
	Color get panel => hexToColor('#12244E'); // Panels
	Color get liquid => hexToColor('#222F5A'); // Liquid
	Color get floatingPanel => hexToColor('#222F5A'); // Floating Panel
	Color get button => hexToColor('#12244E'); // ButtonsSecondary
	Color get buttonSecondary => hexToColor('#111F4C'); // ButtonsSecondary
	Color get puttonPrimarySelected => hexToColor('#0676DC'); // Buttons Selected
}
class Foreground extends Functions {
	Color get liquid => hexToColor('#021942'); // Liquid
}
class Texts extends Functions {
	Color get light => hexToColor('#E9F3F4'); // Text light
}

class Functions {
	Color hexToColor(String code) {
		return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
	}
	MaterialColor buildMaterialColor(Color color) {
		List strengths = <double>[.05];
		Map<int, Color> swatch = {};
		final int r = color.red, g = color.green, b = color.blue;

		for (int i = 1; i < 10; i++) {
			strengths.add(0.1 * i);
		}
		strengths.forEach((strength) {
			final double ds = 0.5 - strength;
			swatch[(strength * 1000).round()] = Color.fromRGBO(
				r + ((ds < 0 ? r : (255 - r)) * ds).round(),
				g + ((ds < 0 ? g : (255 - g)) * ds).round(),
				b + ((ds < 0 ? b : (255 - b)) * ds).round(),
				1,
			);
		});
		return MaterialColor(color.value, swatch);
	}
}