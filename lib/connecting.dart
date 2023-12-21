// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'home.dart';

class ConnectingPage extends StatefulWidget {
	const ConnectingPage({super.key});

	@override
	State<ConnectingPage> createState() => _ConnectingPageState();
	}

	class _ConnectingPageState extends State<ConnectingPage> {
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
												icon: Icon(Icons.account_circle_outlined),
												color: Colors.grey.shade700,
												onPressed: () {
													Navigator.push(
														context,
														PageRouteBuilder(pageBuilder: (_, __, ___) => const HomePage()),
													);
												}
											)
										),
										Expanded(
											flex: 6,
											child: Text(
												"Connecting...",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 25.0, fontWeight: FontWeight.bold),
											),
										),
										Expanded(
											flex: 2,
											child: IconButton(
												icon: Icon(Icons.settings),
												color: Colors.grey.shade700,
												onPressed: () => (),
											)
										)
									]
								)
							),
						]),
					),
				],
			),
		);
	}
}
