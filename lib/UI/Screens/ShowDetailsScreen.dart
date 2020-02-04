import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/Models/ApiRM/GetShowsRM.dart';
import 'package:popflix/CORE/ProviderModels/DataFetcherPM.dart';
import 'package:popflix/CORE/ProviderModels/ShowDetailsPM.dart';
import 'package:popflix/UI/Screens/SeasonsListSelectorScreen.dart';
import 'package:popflix/UI/Shared/EpisodeItemCard.dart';
import 'package:popflix/UI/Shared/MovieItemCard.dart';
import 'package:provider/provider.dart';

class ShowDetailsScreen extends StatefulWidget {
  static const Route = "/showdetailsscreen";
  static const DebugTag = "TAG - SHOW_DETAILS_SCREEN";
  final Show show;

  const ShowDetailsScreen({Key key, this.show}) : super(key: key);

  @override
  _ShowDetailsScreenState createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen>
    with AutomaticKeepAliveClientMixin<ShowDetailsScreen> {
  @override
  void initState() {
    Provider.of<ShowDetailsPM>(context, listen: false)
        .getShowDetails(widget.show.imdbId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final modelS = Provider.of<ShowDetailsPM>(context);
    final model = Provider.of<DataFetcherPM>(context);
    final show = modelS.singleShowDetail;
    return Scaffold(
      backgroundColor: Colors.black,
      body: show != null && show.imdbId == widget.show.imdbId
          ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: size.height / 3,
                  width: size.width,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black45, Colors.black87],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                      )),
                  child: CachedNetworkImage(
                    imageUrl: show.images.fanart,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
                Positioned(
                  left: size.width / 2 - 35,
                  top: size.height / 6 - 35,
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Text(
                    show.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    show.year.toString(),
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Text(
                  show.rating.percentage.toString() + "% liked",
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    show.numSeasons.toString() + " Seasons",
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    show.status.toString(),
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                show.synopsis,
                textAlign: TextAlign.left,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, wordSpacing: 2),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: size.width / 10),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "My List",
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Rate",
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  appBar: TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide:
                        BorderSide(width: 4, color: Colors.red),
                        insets: EdgeInsets.only(
                            left: 8, right: 8, bottom: 50)),
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(
                        left: 0, right: 0, bottom: 10, top: 10),
                    tabs: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Episodes",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "More Like This",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  body: TabBarView(children: <Widget>[
                    SizedBox(
                      height: size.height,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return SeasonsSelectScreen(
                                        isAnime: false,);
                                    }));
                              },
                              child: Text(
                                "Season ${modelS.currentSeasonToDisplay
                                    .toString()} ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height - 150,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                modelS.episodesToDisplay.length,
                                itemBuilder: (context, index) {
                                  return EpisodeItemCard(
                                    item: modelS.episodesToDisplay[index],
                                    image: widget.show.images.fanart,
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 12,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisCount: 3,
                            childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return MovieItemCard(
                            item: model.getShowsWithSameGenres(
                                widget.show)[index],
                          );
                        }),
                  ]),
                ),
              ),
            )
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
