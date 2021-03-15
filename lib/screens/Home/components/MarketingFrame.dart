import 'package:ecommerce/models/MarketingCampaign.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

import 'TimerBar.dart';

class MarketingFrame extends StatefulWidget {
  MarketingFrame({Key key, this.marketingCampaigns}) : super(key: key);

  final List<MarketingCampaign> marketingCampaigns;

  @override
  _MarketingFrameState createState() => _MarketingFrameState();
}

class _MarketingFrameState extends State<MarketingFrame> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var campaign = widget.marketingCampaigns[currentIndex];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 88,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: defaultRadius,
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(campaign.image),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Color.fromARGB(125, 20, 20, 20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            campaign.bigText,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              height: 31 / 25,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.35,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            campaign.smallText,
                            maxLines: 1,
                            style: TextStyle(
                                color: Theme.of(context).buttonColor,
                                height: 16 / 12,
                                fontSize: 12,
                                fontFamily: 'SFProText'),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8,
                ),
                child: Row(
                  children:
                      Iterable<int>.generate(widget.marketingCampaigns.length)
                          .map<Widget>(
                            (i) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: TimerBar(
                                  onFinish: () => setState(() =>
                                      (currentIndex + 1 >=
                                              widget.marketingCampaigns.length)
                                          ? currentIndex = 0
                                          : currentIndex++),
                                  isCurrent: i == currentIndex,
                                  hasPassed: i < currentIndex,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
