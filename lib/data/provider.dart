import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data.dart';

final lofihiphopPlaylistProvider = Provider<Playlist>((ref) {
  return lofihiphopPlaylist;
});
