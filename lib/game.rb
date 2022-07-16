require 'securerandom'
require_relative 'item'
require 'time'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(title, publish_date, last_played_at, multiplayer = true, archived = false, id = SecureRandom.uuid)
    super(title, publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    today = DateTime.now
    age_in_days = today - @last_played_at
    age_in_years = age_in_days.to_i / 365.25
    return true if super && age_in_years > 2

    false
  end

  def to_hash
    { id: @id, title: @title, publish_date: @publish_date, archived: @archived, multiplayer: @multiplayer,
      last_played_at: @last_played_at }
  end
end

# game = Game.new(20, "fjkjjj", 5, true)
# p game.to_hash
# p game.can_be_archived?
