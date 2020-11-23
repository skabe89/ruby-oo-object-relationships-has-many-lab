class Artist

    attr_accessor :name, :songs
    @@all_songs = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        Song.all.collect{|song| song.artist == self ? @songs << song : nil}
        @songs.each{|i| @@all_songs << i}
        @songs
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    def self.song_count
        @@all_songs.uniq.length
    end
end