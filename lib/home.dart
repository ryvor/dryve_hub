	// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'color_scheme.dart';
import 'connecting.dart';
import 'settings.dart';

enum Calendar { day, week, month, year }
CustomScheme colorScheme = CustomScheme();

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	Future<void> _handleRefresh() async {
		return await Future.delayed(Duration(seconds: 2));
	}
	double calculatePercentageOf(double height, double desired) {
		return desired / height;
	}

	@override
	Widget build(BuildContext context) {
		

		List<double> screenSize = [MediaQuery.of(context).size.width, MediaQuery.of(context).size.height];

		List<double> floatingSheetSizes = [calculatePercentageOf(screenSize[1], 40), calculatePercentageOf(screenSize[1], screenSize[1]-90)];

		return Scaffold(
			backgroundColor: colorScheme.background.main,
			body: Stack(
				children: [
					LiquidPullToRefresh(
						// Main body
						onRefresh: _handleRefresh,
						color: colorScheme.foreground.liquid,
						height: 200,
						backgroundColor: colorScheme.background.liquid,
						animSpeedFactor: 5,
						showChildOpacityTransition: false,
						child: Padding(
							padding: EdgeInsets.all(25),
							child: ListView(							
								children: [
									Row(
										// Header
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Expanded(
												flex: 2,
												child: IconButton(
													icon: Icon(Icons.account_circle_outlined),
													color: colorScheme.text.light,
													onPressed: () {
														Navigator.pop(
															context,
															PageRouteBuilder(pageBuilder: (_, __, ___) => const ConnectingPage()),
														);
													}
												)
											),
											Expanded(
												flex: 6,
												child: Text(
													"Welcome back",
													textAlign: TextAlign.center,
													style: TextStyle(
														fontSize: 25.0,
														fontWeight: FontWeight.bold,
														color: colorScheme.text.light
													)
												),
											),
											Expanded(
												flex: 2,
												child: IconButton(
													icon: Icon(Icons.settings),
													color: colorScheme.text.light,
													onPressed: () {
														Navigator.push(
															context,
															CupertinoPageRoute(builder: (context) => const SettingsPage()),
														);
													}
												)
											)
										]
									),
									Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
									StaggeredGrid.count(
										crossAxisCount: 2,
										mainAxisSpacing: 25,
										crossAxisSpacing: 25,
										children: [
											StaggeredGridTile.count(
												crossAxisCellCount: 2,
												mainAxisCellCount: 1,
												child: Container(
													color: colorScheme.background.panel,
													height: 50,
												)
											),
											StaggeredGridTile.count(
												crossAxisCellCount: 1,
												mainAxisCellCount: 1,
												child: ClipRRect(
													borderRadius: BorderRadius.circular(20),
													child: Container(
														color: colorScheme.background.button,
														height: 50,
														child: Text(
															"Lock car",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 25.0,
																fontWeight: FontWeight.bold,
																color: colorScheme.text.light
															),
														),
													)
												)
											),
											StaggeredGridTile.count(
												crossAxisCellCount: 1,
												mainAxisCellCount: 1,
												child: ClipRRect(
													borderRadius: BorderRadius.circular(20),
													child: Container(
														color: colorScheme.background.button,
														height: 50,
														child: Text(
															"Unlock car",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 25.0,
																fontWeight: FontWeight.bold,
																color: colorScheme.text.light
															),
														),
													)
												)
											),
											StaggeredGridTile.count(
												crossAxisCellCount: 1,
												mainAxisCellCount: 1,
												child: ClipRRect(
													borderRadius: BorderRadius.circular(20),
													child: Container(
														color: colorScheme.background.button,
														height: 50,
														child: Text(
															"Close all windows",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 25.0,
																fontWeight: FontWeight.bold,
																color: colorScheme.text.light
															),
														),
													)
												)
											),
											StaggeredGridTile.count(
												crossAxisCellCount: 1,
												mainAxisCellCount: 1,
												child: ClipRRect(
													borderRadius: BorderRadius.circular(20),
													child: Container(
														color: colorScheme.background.button,
														height: 50,
														child: Text(
															"Open all windows",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 25.0,
																fontWeight: FontWeight.bold,
																color: colorScheme.text.light
															),
														),
													)
												)
											),
											Padding(padding: EdgeInsets.all(40))
										],
									)
								]
							),
						),
					),
					DraggableScrollableSheet(
						// Pull-up Menu
						minChildSize: floatingSheetSizes[0],
						initialChildSize: floatingSheetSizes[0],
						maxChildSize: floatingSheetSizes[1],
						builder: (BuildContext context, ScrollController scrollController) {
							return Container(
								decoration: BoxDecoration(
									borderRadius: BorderRadius.only(
										topRight: Radius.circular(20),
										topLeft: Radius.circular(20),
									),
									color: colorScheme.background.floatingPanel,
								),
								child: ListView(
									controller: scrollController,
									children: [
										Padding(
											padding: EdgeInsets.all(10),
											child: ClipRRect(
												borderRadius: BorderRadius.circular(20),
												child: Row(
													mainAxisAlignment: MainAxisAlignment.center,
													children:[
														ClipRRect(
															borderRadius: BorderRadius.circular(20),
															child: Container(
																height: 5,
																width: 100,
																color: colorScheme.background.panel,
															),
														)
													],
												),
											),
										),
										Padding(
											padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
											child: ClipRRect(
												borderRadius: BorderRadius.circular(20),
												child: Container(
													height: 100,
													color: colorScheme.background.buttonSecondary,
													child: Text(
														"Door locks",
														textAlign: TextAlign.center,
														style: TextStyle(
															fontSize: 25.0,
															fontWeight: FontWeight.bold,
															color: colorScheme.text.light
														),
													),
												),
											),
										),
										Padding(
											padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
											child: ClipRRect(
												borderRadius: BorderRadius.circular(20),
												child: Container(
													height: 100,
													color: colorScheme.background.buttonSecondary,
													child: Text(
														"Windows",
														textAlign: TextAlign.center,
														style: TextStyle(
															fontSize: 25.0,
															fontWeight: FontWeight.bold,
															color: colorScheme.text.light
														),
													),
												),
											),
										),
										Padding(
											padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
											child: ClipRRect(
												borderRadius: BorderRadius.circular(20),
												child: Container(
													height: 100,
													color: colorScheme.background.buttonSecondary,
													child: Text(
														"Lighting",
														textAlign: TextAlign.center,
														style: TextStyle(
															fontSize: 25.0,
															fontWeight: FontWeight.bold,
															color: colorScheme.text.light
														),
													),
												),
											),
										),
									]
								),
							);
						},
					),
				],
			),
		);
	}
}
