import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/Models/ApiRM/GetAnimesRM.dart';
import 'package:popflix/CORE/Models/ApiRM/GetMoviesRM.dart';
import 'package:popflix/CORE/Models/ApiRM/GetShowsRM.dart';
import 'package:popflix/UI/Screens/AnimeDetailsScreen.dart';
import 'package:popflix/UI/Screens/MovieDetailsScreen.dart';
import 'package:popflix/UI/Screens/ShowDetailsScreen.dart';
import 'package:popflix/UI/Shared/ShimmerEffectBox.dart';

class MovieItemCard extends StatefulWidget {
  final item;

  const MovieItemCard({Key key, this.item}) : super(key: key);

  @override
  _MovieItemCardState createState() => _MovieItemCardState();
}

class _MovieItemCardState extends State<MovieItemCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget.item is Movie
              ? MovieDetailsScreen(movie: widget.item)
              : widget.item is Show ? ShowDetailsScreen(
            show: widget.item,
          ) : AnimeDetailsScreen(show: widget.item,);
        }));
      },
      child: SizedBox(
        height: size.height / 5,
        width: size.width / 3.5,
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.item.images.banner,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>
                  ShimmerBox(
                    width: size.height / 5,
                    height: size.width / 3.5,
                  ),
              errorWidget: (context, url, error) =>
                  Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
            ),
            widget.item is Anime
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.black87,
                      height: 20,
                      width: size.width / 3.5,
                      child: Text(
                        widget.item.title,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
