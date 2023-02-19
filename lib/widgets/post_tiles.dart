import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/models/post.dart';
import 'package:social_media_app/screens/posts/view_image.dart';
import 'package:social_media_app/widgets/cached_image.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PostTile extends StatefulWidget {
  final PostModel? post;

  PostTile({this.post});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => ViewImage(post: widget.post),
        ));
      },
      child: Container(
        height: 100,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            child: widget.post!.mediaUrl!.split('-imagesplit-')[0].contains('mp4')?
              Image.asset(
                'assets/images/video_thumbnail.png',
              )
              : cachedNetworkImage(widget.post!.mediaUrl!.split('-imagesplit-')[0]),
          ),
        ),
      ),
    );
  }
}

