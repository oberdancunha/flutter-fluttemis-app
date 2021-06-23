import 'package:flutter/material.dart';

import 'locus_details_widget.dart';
import 'locus_features/locus_features_details_widget.dart';

class LocusBodyWidget extends StatelessWidget {
  const LocusBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              LocusDetailsWidget(),
              SizedBox(width: 3),
              LocusFeaturesDetailsWidget(),
            ],
          ),
        ),
      );
}
