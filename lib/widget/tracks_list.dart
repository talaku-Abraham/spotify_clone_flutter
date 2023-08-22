import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider.dart';
import '../presentation/viewmodel/current_track_provider.dart';

class TracksList extends ConsumerStatefulWidget {
  const TracksList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TracksListState();
}

class _TracksListState extends ConsumerState<TracksList> {
  late CurrentTrackProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(getCurrentTrackProviderProvider);
    final songs = ref.read(lofihiphopPlaylistProvider).songs;
    return DataTable(
        showCheckboxColumn: false,
        dataRowHeight: 54.0,
        columns: const [
          DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(
            label: Icon(Icons.access_time),
          ),
        ],
        rows: songs.map((song) {
          final selected = provider.selected?.id == song.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).iconTheme.color);

          return DataRow(
              cells: [
                DataCell(
                  Text(
                    song.title,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(song.artist, style: textStyle),
                ),
                DataCell(
                  Text(song.album, style: textStyle),
                ),
                DataCell(
                  Text(
                    song.duration,
                    style: textStyle,
                  ),
                )
              ],
              selected: selected,
              onSelectChanged: (_) => provider.selectTrack(song));
        }).toList());
  }
}
