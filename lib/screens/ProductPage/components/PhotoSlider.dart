import 'package:ecommerce/components/PhotoBox.dart';
import 'package:flutter/material.dart';

class PhotoSlider extends StatefulWidget {
  PhotoSlider({Key key, this.photos, this.callback}) : super(key: key);

  final List<String> photos;
  final void Function(int) callback;

  @override
  _PhotoSliderState createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  ScrollController _scrollController = new ScrollController();

  bool onScrollEnd(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification) {
      double o = _scrollController.offset;
      for (var i = 0; i < widget.photos.length; i++) {
        double width = MediaQuery.of(context).size.width;
        double getLimit(double dif) => (i + dif) * width;
        if (o > getLimit(-0.5) && o < getLimit(0.5)) {
          Future.delayed(
              Duration(microseconds: 1),
              () => _scrollController.animateTo(
                    i * width,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.decelerate,
                  ));
          widget.callback(i);
          break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: onScrollEnd,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.photos
              .map<Widget>(
                (p) => Container(
                  width: MediaQuery.of(context).size.width,
                  child: PhotoBox(image: p),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
