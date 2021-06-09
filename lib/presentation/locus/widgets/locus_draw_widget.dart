import 'package:flutter/material.dart';

import 'locus_features_colors_labels.dart';
import 'locus_scale_widget.dart';

class LocusDrawWidget extends StatelessWidget {
  const LocusDrawWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - 16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const LocusFeaturesColorsLabels(),
              const SizedBox(height: 15),
              LocusScaleWidget(),
            ],
          ),
        ),
      );
}
