import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';

class CurrentTrackProvider extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}

final getCurrentTrackProviderProvider =
    ChangeNotifierProvider<CurrentTrackProvider>((ref) {
  return CurrentTrackProvider();
});
