import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider.dart';

class PlayListHeader extends ConsumerWidget {
  const PlayListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(lofihiphopPlaylistProvider);
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              provider.imageUrl,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    provider.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    provider.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      'Created by ${provider.creator} \u2022  ${provider.songs.length} songs, ${provider.duration}, '),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        _PlayListButtons(followers: provider.followers),
      ],
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  final String followers;
  const _PlayListButtons({required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).iconTheme.color,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 12.0, letterSpacing: 2.0)),
          onPressed: () {},
          child: const Text(
            'Play',
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text(
          'Followers \n$followers',
          style:
              Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
