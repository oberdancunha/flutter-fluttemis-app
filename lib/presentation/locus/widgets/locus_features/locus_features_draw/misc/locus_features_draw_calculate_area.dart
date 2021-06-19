import '../../../../../../domain/locus/feature.dart';

class LocusFeaturesDrawCalculateArea {
  final double screenWidth;
  final double screenHeight;
  final int locusLength;
  final int minPixelsPerCharacter;
  final double minHeight;
  final Map<String, List<Feature>> featuresTypesList;

  LocusFeaturesDrawCalculateArea({
    required this.screenWidth,
    required this.screenHeight,
    required this.locusLength,
    required this.minPixelsPerCharacter,
    required this.minHeight,
    required this.featuresTypesList,
  });

  int get locusLengthByCharacters => locusLength.toString().length;

  int get pixelsPerCharacter {
    var pixelsPerCharacter = ((locusLength / screenWidth) / locusLengthByCharacters).round();
    if (pixelsPerCharacter < minPixelsPerCharacter) {
      pixelsPerCharacter = minPixelsPerCharacter;
    }

    return pixelsPerCharacter;
  }

  double get scale => (screenWidth / locusLength) * (pixelsPerCharacter / 3);

  double get screenWidthScale => locusLength * scale;

  double get maxHeight => screenHeight / 3;

  double get typesHeight => double.tryParse((featuresTypesList.keys.length * 40).toString())!;

  double get totalTypesHeight => double.tryParse((featuresTypesList.keys.length * 55).toString())!;

  double get height => totalTypesHeight >= maxHeight
      ? maxHeight
      : totalTypesHeight >= minHeight
          ? totalTypesHeight
          : minHeight;
}
