#!/usr/bin/env ruby
require_relative '../lib/app'
# require './data/storage'

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
    # store = Store.new
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
        # data1 = app.books.map(&:to_hash)
        # store.write('books', './data/books.json', data1)

        # data2 = app.people.map(&:to_hash)
        # store.write('people', './data/people.json', data2)

        # puts 'Thanks for using my program. Bye!'
        user_finished = true
      else
        puts 'Invalid Selection. Please select any input between 1-8 or b, ma, mo, g'
      end
    end
  end
end

main = Main.new
main.main
