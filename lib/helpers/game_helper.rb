require_relative '../game'
require 'date'

class GameCreator
  def create_a_game
    puts 'Please type the game title'
    title = gets.chomp

    puts 'Please enter the publish date as YYYY-MM-DD'
    publish_date = DateTime.parse(gets.chomp)

    puts 'Please enter the last played date as YYYY-MM-DD'
    last_played_at = DateTime.parse(gets.chomp)

    Game.new(title, publish_date, last_played_at)
  end
end