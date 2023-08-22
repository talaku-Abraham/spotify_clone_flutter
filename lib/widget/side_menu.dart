import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 300,
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/SpotifyLogo.png',
              height: 55.0,
              filterQuality: FilterQuality.high,
            ),
          ),
          const _SideMenuIconTab(
            icon: Icons.home,
            name: 'home',
          ),
          const _SideMenuIconTab(
            icon: Icons.search,
            name: 'search',
          ),
          const _SideMenuIconTab(
            icon: Icons.audiotrack,
            name: 'radio',
          ),
          const SizedBox(
            height: 12.0,
          ),
          _LibraryPlayist(),
        ],
      ),
    );
  }
}

class _LibraryPlayist extends StatefulWidget {
  @override
  State<_LibraryPlayist> createState() => _LibraryPlayistState();
}

class _LibraryPlayistState extends State<_LibraryPlayist> {
  ScrollController? _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList()
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlist
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData icon;
  final String name;
  const _SideMenuIconTab({
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
