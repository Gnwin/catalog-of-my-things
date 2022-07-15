require_relative '../music_album'
require_relative '../genre'
require_relative '../source'
require_relative 'genre_helper'
require_relative 'source_helper'
require 'date'

class MusicAlbumCreator
  def initialize
    @genre_creator = GenreCreator.new
    @source_creator = SourceCreator.new
  end

  def create_a_music_album
    puts 'What is the title of Music Album?'
    title = gets.chomp

    genre = @genre_creator.create_genre

    source = @source_creator.create_source

    puts 'What did this album was published? (YYYY-MM-DD)'
    publish_date = DateTime.parse(gets.chomp)

    MusicAlbum.new(title, publish_date, genre, source)
  end
end
