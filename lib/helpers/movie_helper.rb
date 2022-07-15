require_relative '../movie'
require_relative 'genre_helper'
require_relative 'source_helper'
require 'date'

class MovieCreator
  def initialize
    @genre_creator = GenreCreator.new
    @source_creator = SourceCreator.new
  end

  def create_a_movie
    puts 'Type the movie here:'
    title = gets.chomp

    genre = @genre_creator.create_genre

    source = @source_creator.create_source

    puts 'Type the movie date (YYYY-MM-DD) here:'
    publish_date = DateTime.parse(gets.chomp)

    Movie.new(title, publish_date, genre, source)
  end
end
