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
            child: Image.asset('assets/SpotifyLogo.png', height: 55.0),
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YOUR LIBRARY',
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PLAYLIST',
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
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
