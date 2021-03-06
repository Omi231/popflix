import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/ProviderModels/DataFetcherPM.dart';
import 'package:popflix/UI/Shared/AnimeWorthWatch.dart';
import 'package:popflix/UI/Shared/BingeWorthyTVShows.dart';
import 'package:popflix/UI/Shared/NewReleasesOf.dart';
import 'package:popflix/UI/Shared/PopularMovies.dart';
import 'package:popflix/UI/Shared/PopularOnList.dart';
import 'package:popflix/UI/Shared/ShimmerEffectBox.dart';
import 'package:popflix/UI/Shared/SingleFirstPosterFeaturedItem.dart';
import 'package:popflix/UI/Shared/TrailerView.dart';
import 'package:provider/provider.dart';

class MainScreenTab extends StatefulWidget {
  @override
  _MainScreenTabState createState() => _MainScreenTabState();
}

class _MainScreenTabState extends State<MainScreenTab> {
  @override
  Widget build(BuildContext context) {
    final hsModel = Provider.of<DataFetcherPM>(context);
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: hsModel.isDataFetched()
            ? Column(
                children: <Widget>[
                  SingleFirstPosterFeaturedItem(item: hsModel.randomItemForFirstPoster),
                  BingeWorthTVShows(),
                  PopularMovies(),
                  AnimesWorthWatch(),
                  TrailerView(),
                  PopularOnList(name: "action"),
                  PopularOnList(
                    name: "crime",
                  ),
                  PopularOnList(
                    name: "family",
                  ),
                  NewReleaseListOf(
                    name: "movies",
                  ),
                  NewReleaseListOf(
                    name: "shows",
                  ),
                  NewReleaseListOf(
                    name: "animes",
                  ),
                  //MyList()
                ],
              )
            : ShimmerBox(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}
