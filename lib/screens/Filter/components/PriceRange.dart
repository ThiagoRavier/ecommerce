import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({Key key, this.start, this.end, this.onChanged})
      : super(key: key);

  final double start;
  final double end;
  final void Function(RangeValues) onChanged;

  @override
  Widget build(BuildContext context) {
    double minValue = 0;
    double maxValue = 5000;
    double start = this.start ?? minValue;
    double end = this.end ?? maxValue;
    Radius radius = Radius.circular(8);
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            thumbColor: Colors.white,
            activeTrackColor: Theme.of(context).buttonColor,
            inactiveTrackColor: Theme.of(context).dividerColor,
            trackHeight: 4,
          ),
          child: RangeSlider(
            values: RangeValues(start, end),
            min: minValue,
            max: maxValue,
            onChanged: onChanged,
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
                child: Row(
                  children: [
                    _RangeValue(
                      value: start,
                      borderRadius: BorderRadius.only(
                        bottomLeft: radius,
                        topLeft: radius,
                      ),
                    ),
                    _RangeValue(
                      value: end,
                      borderRadius: BorderRadius.only(
                        bottomRight: radius,
                        topRight: radius,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _RangeValue extends StatelessWidget {
  const _RangeValue({Key key, this.value, this.borderRadius}) : super(key: key);

  final double value;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('R\$ ' + value.toStringAsFixed(0)),
        ),
        decoration: inputDecoration(context).copyWith(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
