require_relative 'book'
require_relative 'music_album'
require_relative 'movie'
require_relative 'game'
require_relative 'genre'
require_relative 'label'
require_relative 'author'
require_relative 'source'

require_relative './helpers/book_helper'
require_relative './helpers/music_album_helper'
require_relative './helpers/movie_helper'
require_relative './helpers/game_helper'
require_relative './helpers/genre_helper'
require_relative './helpers/label_helper'
require_relative './helpers/author_helper'
require_relative './helpers/source_helper'

# require_relative '../data/storage'
require 'json'
require 'pry'

class App
  # include AppHelper
  # attr_accessor :books, :people, :rentals

  # @@store = Store.new

  # @@booksdata = @@store.read('books', './data/books.json')
  # @@booksdata = [] if @@booksdata.nil?
  # @@booksdata = @@booksdata.map do |book|
  #   Book.new(book['title'], book['author'])
  # end

  # @@peopledata = @@store.read('people', './data/people.json')
  # @@peopledata = [] if @@peopledata.nil?
  # @@peopledata = @@peopledata.map do |person|
  #   case person['class_name']
  #   when 'Student'
  #     Student.new(person['name'], person['age'], person['classroom'], person['parent_permission'], person['id'])
  #   when 'Teacher'
  #     Teacher.new(person['name'], person['age'], person['specialization'], person['parent_permission'], person['id'])
  #   end
  # end

  def initialize
    # @store = Store.new

    @book_creator = BookCreator.new
    @music_album_creator = MusicAlbumCreator.new
    @movie_creator = MovieCreator.new
    @game_creator = GameCreator.new

    @books = []
    @music_albums = []
    @movies = []
    @games = []
  end

  def list_all_books
    puts 'No books here, pick a character to create a book' if @books.empty?
    @books.each { |book| puts "[Book] Title: \"#{book.title}\", Author: \"#{book.author.first_name}\"" }
  end

  def list_all_music_albums
    puts 'No music_albums here, pick a character to create a music_album' if @music_albums.empty?
    @music_albums.each do |music_album|
      puts "[Music Album] Title: \"#{music_album.title}\", Genre: #{music_album.genre.name}, Source: \"#{music_album.source.name}\""
    end
  end

  def list_all_movies
    puts 'No movies here, pick a number to create a book' if @movies.empty?
    @movies.each { |movie| puts "[Movie] Title: \"#{movie.title}\", Genre: \"#{movie.genre.name}\", Source: \"#{movie.source.name}\"" }
  end

  def list_all_games
    puts 'No games here, pick a character to create a music_album' if @games.empty?
    @games.each do |game|
      puts "[Game] Name: #{game.title}, Publish date: #{game.publish_date}"
    end
  end

  def list_all_genres
    puts 'no music or movies here to show genres, pick a character to create' if @music_albums.empty? || @movies.empty?
    [*@music_albums, *@movies].each { |media| puts media.genre.name.to_s }
  end

  def list_all_labels
    puts 'no books here to show labels, pick a character to create' if @books.empty?
    @books.each { |book| puts book.label.title }
  end

  def list_all_authors
    puts 'no books here to show authors, pick a character to create' if @books.empty?
    @books.each { |book| puts "#{book.author.first_name} #{book.author.last_name}" }
  end

  def list_all_sources
    puts 'no music or movies here to show sources, pick a character to create' if @music_albums.empty? || @movies.empty?
    [*@music_albums, *@movies].each { |media| puts media.source.name.to_s }
  end

  def create_a_book
    @books << @book_creator.create_a_book
  end

  def create_a_music_album
    @music_albums << @music_album_creator.create_a_music_album
  end

  def create_a_movie
    @movies << @movie_creator.create_a_movie
  end

  def create_a_game
    @games << @game_creator.create_a_game
  end
end