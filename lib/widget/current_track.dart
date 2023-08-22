import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/presentation/viewmodel/current_track_provider.dart';

import '../data/data.dart';

class CurrentTrack extends ConsumerWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black87,
      height: 84,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls()
          ],
        ),
      ),
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 4.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            )
          ],
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.close_fullscreen_outlined))
      ],
    );
  }
}

class _PlayerControls extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(getCurrentTrackProviderProvider).selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(Icons.shuffle),
              iconSize: 20,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 20,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 30,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(Icons.repeat),
              iconSize: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ],
    );
  }
}

class _TrackInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Song? selected = ref.watch(getCurrentTrackProviderProvider).selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            ),
            const SizedBox(
              width: 12.0,
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
      ],
    );
  }
}
