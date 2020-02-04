import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/Models/ApiRM/GetShowsRM.dart';
import 'package:popflix/CORE/ProviderModels/DataFetcherPM.dart';
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
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final model = Provider.of<DataFetcherPM>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
                    imageUrl: widget.show.images.fanart,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                    widget.show.title,
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
                    widget.show.year.toString(),
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Text(
                  widget.show.rating.percentage.toString() + "% liked",
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    widget.show.numSeasons.toString() + " Seasons",
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
                widget.show.slug,
                textAlign: TextAlign.left,
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
                          style: TextStyle(color: Colors.white70, fontSize: 10),
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
                          style: TextStyle(color: Colors.white70, fontSize: 10),
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
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.file_download,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Download",
                          style: TextStyle(color: Colors.white70, fontSize: 10),
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
                length: 1,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  appBar: TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 4, color: Colors.red),
                        insets: EdgeInsets.only(left: 8, right: 8, bottom: 50)),
                    isScrollable: true,
                    labelPadding:
                        EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                    tabs: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "More Like This",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
//                      Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text(
//                          "Trailer",
//                          style: TextStyle(color: Colors.white, fontSize: 18),
//                        ),
//                      ),
                    ],
                  ),
                  body: TabBarView(children: <Widget>[
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisCount: 3,
                            childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return MovieItemCard(
                            item: model
                                .getShowsWithSameGenres(widget.show)[index],
                          );
                        }),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}