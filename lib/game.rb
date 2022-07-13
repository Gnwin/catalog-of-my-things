require 'securerandom'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, source, label, publish_date, archived, multiplayer, last_played_at, id = SecureRandom.uuid)
    super(genre, author, source, label, publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super == true && last_played_at > 2 ? true : false
  end
end