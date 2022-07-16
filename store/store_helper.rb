require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

class CatalogStoreAccess
  attr_reader :store

  def initialize(store)
    @store = store
  end

  def receive
    booksdata = @store.read('books', './data/books.json')
    booksdata = [] if booksdata.nil?
    booksdata = booksdata.map do |book|
      author = Author.new(book['author']['first_name'], book['author']['last_name'], book['author']['id'])
      label = Label.new(book['label']['title'], book['label']['last_name'], book['label']['id'])
      Book.new(book['title'], book['publish_date'], book['publisher'], book['cover_state'], author, label, book['archived'], book['id'] )
    end

    music_albums = @store.read('music_albums', './data/music_albums.json')
    music_albums = [] if music_albums.nil?
    music_albums = music_albums.map do |person|
      genre = Genre.new(person['genre']['name'], person['genre']['id'])
      source = Source.new(person['source']['name'], person['source']['id'])
      MusicAlbum.new(person['title'], person['publish_date'], genre, source, person['on_spotify'], person['archived'], person['id'])
    end

    movies = @store.read('movies', './data/movies.json')
    movies = [] if movies.nil?
    movies = movies.map do |movie|
      genre = Genre.new(movie['genre']['name'], movie['genre']['id'])
      source = Source.new(movie['source']['name'], movie['source']['id'])
      Movie.new(movie['title'], movie['publish_date'], genre, source, movie['silent'], movie['archived'], movie['id'])
    end

    games = @store.read('games', './data/games.json')
    games = [] if games.nil?
    games = games.map do |game|
      Game.new(game['title'], game['publish_date'], game['last_played_at'], game['multiplayer'], game['archived'], game['id'])
    end

    [booksdata, music_albums, movies, games]
  end

  def send(books_data, music_album_data, movies_data, games_data)
    @store.write('books', './data/books.json', books_data)
    @store.write('music_albums', './data/music_albums.json', music_album_data)
    @store.write('movies', './data/movies.json', movies_data)
    @store.write('games', './data/games.json', games_data)
  end
end