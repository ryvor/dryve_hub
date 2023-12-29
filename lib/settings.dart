// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class SettingsPage extends StatefulWidget {
	const SettingsPage({super.key});

	@override
	State<SettingsPage> createState() => _SettingsPageState();
	}

	class _SettingsPageState extends State<SettingsPage> {
	Future<void> _handleRefresh() async {
		return await Future.delayed(Duration(seconds: 2));
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.deepPurple.shade200,
			body: Stack(
				children: [
					LiquidPullToRefresh(
						// Main body
						onRefresh: _handleRefresh,
						color: Colors.deepPurple,
						height: 200,
						backgroundColor: Colors.deepPurple.shade200,
						animSpeedFactor: 5,
						showChildOpacityTransition: false,
						child: ListView(children: [
							Padding(
								// header
								padding: EdgeInsets.fromLTRB(25, 25, 25, 12.5),
								child: Row(
									// Header
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Expanded(
											flex: 2,
											child: IconButton(
												icon: Icon(Icons.arrow_back),
												color: Colors.grey.shade700,
												onPressed: () {
													Navigator.pop(context);
												}
											)
										),
										Expanded(
											flex: 6,
											child: Text(
												"Settings",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 25.0, fontWeight: FontWeight.bold),
											),
										),
										Expanded(
											flex: 2,
											child: Text("")
										)
									]
								)
							),
							Padding(
								// Main image
								padding: EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
								child: ClipRRect(
									borderRadius: BorderRadius.circular(20),
									child:  Container(
										height: 100,
										color: Colors.deepPurple,
									)
								),
							),
							Padding(
								// Main image
								padding: EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
								child: ClipRRect(
									borderRadius: BorderRadius.circular(20),
									child:  Container(
										height: 100,
										color: Colors.deepPurple,
									)
								),
							),
							Padding(
								// Main image
								padding: EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
								child: ClipRRect(
									borderRadius: BorderRadius.circular(20),
									child:  Container(
										height: 100,
										color: Colors.deepPurple,
									)
								),
							),
							Padding(
								// Main image
								padding: EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
								child: ClipRRect(
									borderRadius: BorderRadius.circular(20),
									child:  Container(
										height: 100,
										color: Colors.deepPurple,
									)
								),
							),
						]),
					),
				],
			),
		);
	}
}
