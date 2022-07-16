#!/usr/bin/env ruby
require_relative '../lib/app'
require_relative '../store/store'

class Main
  def display_menu
    puts "\n"
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'

    puts '9 - Create/Add a book'
    puts '10 - Create/Add a music album'
    puts '11 - Create/Add a movie'
    puts '12 - Create/Add a game'

    puts '0 - exit'
  end

  def main
    app = App.new
    store = Store.new
    user_finished = false
    until user_finished
      display_menu
      selection = gets.chomp.to_i
      case selection
      when 1 then app.list_all_books
      when 2 then app.list_all_music_albums
      when 3 then app.list_all_movies
      when 4 then app.list_all_games
      when 5 then app.list_all_genres
      when 6 then app.list_all_labels
      when 7 then app.list_all_authors
      when 8 then app.list_all_sources

      when 9 then app.create_a_book
      when 10 then app.create_a_music_album
      when 11 then app.create_a_movie
      when 12 then app.create_a_game

      when 0
        books_data = app.books.map(&:to_hash)
        store.write('books', './data/books.json', books_data)

        music_album_data = app.music_albums.map(&:to_hash)
        store.write('music_albums', './data/music_albums.json', music_album_data)

        movies_data = app.movies.map(&:to_hash)
        store.write('movies', './data/movies.json', movies_data)

        games_data = app.games.map(&:to_hash)
        store.write('games', './data/games.json', games_data)

        puts 'Thanks for using my program. Bye!'
        user_finished = true
      else
        puts 'Invalid Selection. Please select any number between 1-12'
      end
    end
  end
end

main = Main.new
main.main
