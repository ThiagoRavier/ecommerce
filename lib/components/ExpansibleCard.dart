import 'package:ecommerce/components/CustomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansibleCard extends StatefulWidget {
  ExpansibleCard({Key key, @required this.child, this.topWidget})
      : super(key: key);

  final Widget child;
  final Widget topWidget;

  @override
  _ExpansibleCardState createState() => _ExpansibleCardState();
}

class _ExpansibleCardState extends State<ExpansibleCard>
    with TickerProviderStateMixin {
  var isExpanded = false;
  static const initialHeight = 76.0;
  static const animationTime = 200;
  double maxHeight = double.infinity;
  var key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.topWidget,
          AnimatedSize(
            vsync: this,
            alignment: Alignment.topCenter,
            duration: Duration(milliseconds: isExpanded ? animationTime : 1),
            clipBehavior: Clip.hardEdge,
            child: AnimatedContainer(
              duration: Duration(milliseconds: isExpanded ? 1 : animationTime),
              constraints: BoxConstraints(
                  maxHeight: isExpanded ? maxHeight : initialHeight),
              child: Container(child: widget.child, key: key),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() => isExpanded = !isExpanded);
              Future.delayed(
                  Duration(milliseconds: animationTime + 10),
                  () => setState(() => maxHeight = isExpanded
                      ? key.currentContext.size.height
                      : double.infinity));
            },
            behavior: HitTestBehavior.opaque,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(
                    isExpanded
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: 16),
              ),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
