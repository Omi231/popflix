import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/ProviderModels/DataFetcherPM.dart';
import 'package:popflix/CORE/ProviderModels/UIUpdatesPM.dart';
import 'package:popflix/UI/Screens/HomeScreen.dart';
import 'package:popflix/UI/Screens/MovieDetailsScreen.dart';
import 'package:popflix/UI/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UIUpdatePM>(create: (_) => UIUpdatePM()),
        ChangeNotifierProvider<DataFetcherPM>(create: (_) => DataFetcherPM()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          SplashScreen.Route: (context) => SplashScreen(),
          HomeScreen.Route: (context) => HomeScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
