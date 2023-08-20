const yourLibrary = [
  'Made For you',
  'Recently Played',
  'Liked Songs',
  'Album',
  'Podcast'
];

const playlist = [
  'Today\'s Top Hits',
  'Discover Weekly',
  'Release Radar',
  'Chill',
  'Background',
  'lofi hip hop musics - beats to relax/study to',
  'Vibes Right Now',
  'Time Capsule',
  'Summer Rewind',
  'Dank Doggo Tunes',
  'Sleepy Doge'
];

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;

  const Song(this.id, this.title, this.artist, this.album, this.duration);
}

const _lofihiphopMusics = [
  Song('0', 'Snowman', 'WYS', '1 Am. Study Session', '3:15'),
  Song('1', 'Healthy Distraction', 'less People', 'one day It\'s over', '2:18'),
  Song('2', 'Far Away', 'Mila Coolness', 'Silent River', '2:39'),
  Song('3', 'Call You Soon', 'Louk, Glimlip', 'Can We Talk', '2:35'),
  Song('4', 'Winter Sun', 'Bcalm, Banks', 'Feelings', '2:15'),
  Song('5', 'Hope', 'No Spirit', 'Memories We Made', '1:57'),
  Song('6', 'A Better Place', 'Project AER, Exit', 'Growth Pattern', '2:00'),
  Song('7', 'Misty Down', 'BluntOne', 'Autum in Budapest', '2:34'),
  Song('8', 'Hourglass', 'Thaehan', 'Hourglass', '1:43'),
  Song('9', 'After Sunset', 'Project AER,WYS', '3 Am. Study Session', '2:41'),
  Song('10', 'Child', 'Ambulo', 'Polar', '2:12'),
];

class Playlist {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final String creator;
  final String duration;
  final String followers;
  final List<Song> songs;

  const Playlist(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.creator,
      required this.duration,
      required this.followers,
      required this.songs});
}

const lofihiphopPlaylist = Playlist(
    id: '5-playlist',
    name: 'lofi hip hop music - beats to relax/ study to',
    imageUrl: 'assets/lofigirl.jpg',
    description:
        'A daily session of chill beats - perfect to help you relax & study',
    creator: 'Lofi Girl',
    duration: '28min',
    followers: '5,351,685',
    songs: _lofihiphopMusics);
