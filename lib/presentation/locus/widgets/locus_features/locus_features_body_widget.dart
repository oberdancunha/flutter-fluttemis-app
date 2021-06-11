import 'package:flutter/material.dart';

import '../../../core/templates/container_box_template.dart';
import 'locus_features_colors_labels_widget.dart';
import 'locus_features_scale_widget.dart';

class LocusFeaturesBodyWidget extends StatelessWidget {
  const LocusFeaturesBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ContainerBoxTemplate(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const LocusFeaturesColorsLabelsWidget(),
              const SizedBox(height: 15),
              LocusFeaturesScaleWidget(),
            ],
          ),
        ),
      );
}
