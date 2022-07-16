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

require_relative '../store/store'
require 'json'
require 'pry'

class App
  attr_reader :books, :music_albums, :games, :movies

  @@store = Store.new

  @@booksdata = @@store.read('books', './data/books.json')
  @@booksdata = [] if @@booksdata.nil?
  @@booksdata = @@booksdata.map do |book|
    author = Author.new(book['author']['first_name'], book['author']['last_name'], book['author']['id'])
    label = Label.new(book['label']['title'], book['label']['last_name'], book['label']['id'])
    Book.new(book['title'], book['publish_date'], book['publisher'], book['cover_state'], author, label, book['archived'], book['id'] )
  end

  @@music_albums = @@store.read('music_albums', './data/music_albums.json')
  @@music_albums = [] if @@music_albums.nil?
  @@music_albums = @@music_albums.map do |person|
    genre = Genre.new(person['genre']['name'], person['genre']['id'])
    source = Source.new(person['source']['name'], person['source']['id'])
    MusicAlbum.new(person['title'], person['publish_date'], genre, source, person['on_spotify'], person['archived'], person['id'])
  end

  @@movies = @@store.read('movies', './data/movies.json')
  @@movies = [] if @@movies.nil?
  @@movies = @@movies.map do |movie|
    genre = Genre.new(movie['genre']['name'], movie['genre']['id'])
    source = Source.new(movie['source']['name'], movie['source']['id'])
    Movie.new(movie['title'], movie['publish_date'], genre, source, movie['silent'], movie['archived'], movie['id'])
  end

  @@games = @@store.read('games', './data/games.json')
  @@games = [] if @@games.nil?
  @@games = @@games.map do |game|
    Game.new(game['title'], game['publish_date'], game['last_played_at'], game['multiplayer'], game['archived'], game['id'])
  end

  def initialize
    @book_creator = BookCreator.new
    @music_album_creator = MusicAlbumCreator.new
    @movie_creator = MovieCreator.new
    @game_creator = GameCreator.new

    p @@booksdata

    @books =  @@booksdata
    @music_albums = @@music_albums
    @movies = @@movies
    @games = @@games
  end

  def list_all_books
    puts 'No books here, pick a character to create a book' if @books.empty?
    @books.each { |book| puts "[Book] Title: \"#{book.title}\", Author: \"#{book.author.first_name}\" " }
  end

  def list_all_music_albums
    puts 'No music_albums here, pick a character to create a music_album' if @music_albums.empty?
    @music_albums.each do |music_album|
      puts "[Music Album] Title: \"#{music_album.title}\", Genre: #{music_album.genre.name}, Source: \"#{music_album.source.name}\""
    end
  end

  def list_all_movies
    puts 'No movies here, pick a number to create a book' if @movies.empty?
    @movies.each do |movie|
      puts "[Movie] Title: \"#{movie.title}\", Genre: \"#{movie.genre.name}\", Source: \"#{movie.source.name}\""
    end
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
