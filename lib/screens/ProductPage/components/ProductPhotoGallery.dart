import 'package:ecommerce/screens/ProductPage/components/PhotoSlider.dart';
import 'package:flutter/material.dart';

class ProductPhotoGallery extends StatefulWidget {
  ProductPhotoGallery({Key key, this.photos}) : super(key: key);

  final List<String> photos;

  @override
  _ProductPhotoGalleryState createState() => _ProductPhotoGalleryState();
}

class _ProductPhotoGalleryState extends State<ProductPhotoGallery> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          PhotoSlider(
              photos: widget.photos,
              callback: (int i) => setState(() => selectedIndex = i)),
          if (widget.photos.length > 1)
            Positioned(
              width: MediaQuery.of(context).size.width,
              left: 0,
              bottom: 16,
              child: Container(
                alignment: Alignment.topCenter,
                child: _DotOrderMarker(
                  totalNumber: widget.photos.length,
                  selectedIndex: selectedIndex,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DotOrderMarker extends StatelessWidget {
  const _DotOrderMarker({Key key, this.totalNumber, this.selectedIndex})
      : super(key: key);

  final int totalNumber;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: Iterable<int>.generate(totalNumber)
          .map<Widget>(
            (i) => Container(
                width: 8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: i == selectedIndex
                          ? Colors.white
                          : Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
          )
          .toList(),
    );
  }
}
