require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end
    
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    created_song = Song.new_by_name(name)
    created_song.save
    created_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song == nil
      new_song = self.create_by_name(name)
    end
    new_song
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    name_and_artist = filename.split(/[.-]/)
    name_and_artist[0] = new_song.artist_name
    name_and_artist[2] = new_song.name
    binding.pry
    new_song
  end


end