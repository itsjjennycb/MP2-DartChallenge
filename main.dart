
class Song {
  String title;
  String artist;
  int duration; // Duration in seconds

  
  Song(this.title, this.artist, this.duration);

  
  String getDetails() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return "$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})";
  }
}


class Playlist {
  String name;
  List<Song> songs;

  
  Playlist(this.name, this.songs);

  
  void addSong(Song song) {
    songs.add(song);
  }

  
  int getTotalDuration() {
    return songs.fold(0, (total, song) => total + song.duration);
  }

  
  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }

  
  void printPlaylist() {
    print("Playlist: $name");
    for (var song in songs) {
      print(song.getDetails());
    }
  }
}


class MusicFestival {
  String name;
  List<Playlist> stages;

  
  MusicFestival(this.name, this.stages);

  
  int getTotalDuration() {
    return stages.fold(0, (total, stage) => total + stage.getTotalDuration());
  }

  
  void printFestivalDetails() {
    print("Festival: $name");
    for (var stage in stages) {
      stage.printPlaylist();
    }
  }
}

void main() {
  
  Song song1 = Song('Take All The  Love', 'Arthur Nery', 210);
  Song song2 = Song('Million Dollar Baby', 'Tommy Richman', 215);
  Song song3 = Song('Sining', 'Dionela ft. Jay R', 210);
  Song song4 = Song('Dilaw', 'Maki', 220);
  Song song5 = Song('Lagi', 'Nasty', 230);

  
  Playlist mainStage = Playlist('Main Stage', [song1, song2, song3, song4, song5]);

  
  Playlist indieStage = Playlist('Indie Stage', [song2, song3, song4]);
  Playlist electronicStage = Playlist('Electronic Stage', [song1, song5]);

  
  MusicFestival festival = MusicFestival('My Music Festival', [mainStage, indieStage, electronicStage]);

  
  print("Total Festival Duration: ${festival.getTotalDuration()} seconds");

  
  print("Random Songs:");
  print("Main Stage: ${mainStage.songs[0].getDetails()}");
  print("Indie Stage: ${indieStage.songs[1].getDetails()}");
  print("Electronic Stage: ${electronicStage.songs[0].getDetails()}");

  
  mainStage.sortByArtist();
  print("\nMain Stage playlist sorted by artist:");
  mainStage.printPlaylist();
}
