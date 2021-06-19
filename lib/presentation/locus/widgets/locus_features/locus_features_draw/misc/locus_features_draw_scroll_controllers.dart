import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../../../../../domain/locus/locus.dart';

class LocusFeaturesDrawScrollControllers {
  late Map<Locus, List<ScrollController>> _mapControllers = {};
  late ScrollController _controllerScale;
  late ScrollController _controllerPosition;
  late ScrollController _controllerLabels;
  late ScrollController _controllerFeatures;

  void createOrSet({required Locus locus}) {
    if (_mapControllers.containsKey(locus)) {
      _controllerScale = _mapControllers[locus]!.elementAt(0);
      _controllerPosition = _mapControllers[locus]!.elementAt(1);
      _controllerLabels = _mapControllers[locus]!.elementAt(2);
      _controllerFeatures = _mapControllers[locus]!.elementAt(3);
    } else {
      final controllersScalePosition = LinkedScrollControllerGroup();
      _controllerScale = controllersScalePosition.addAndGet();
      _controllerPosition = controllersScalePosition.addAndGet();
      final controllersLabelsFeatures = LinkedScrollControllerGroup();
      _controllerLabels = controllersLabelsFeatures.addAndGet();
      _controllerFeatures = controllersLabelsFeatures.addAndGet();
      _mapControllers = {
        locus: [
          _controllerScale,
          _controllerPosition,
          _controllerLabels,
          _controllerFeatures,
        ],
      };
    }
  }

  ScrollController get controllerScale => _controllerScale;
  ScrollController get controllerPosition => _controllerPosition;
  ScrollController get controllerLabels => _controllerLabels;
  ScrollController get controllerFeatures => _controllerFeatures;

  void dispose() {
    _controllerScale.dispose();
    _controllerPosition.dispose();
    _controllerLabels.dispose();
    _controllerFeatures.dispose();
    _mapControllers.forEach(
      (key, controllers) => controllers.map(
        (controller) => controller.dispose(),
      ),
    );
  }
}
