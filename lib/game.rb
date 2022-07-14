require 'securerandom'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived = false, id = SecureRandom.uuid)
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super == true && last_played_at > 2 ? true : false
  end

  def to_hash
    { id: @id, publish_date: @publish_date, archived: @archived, multiplayer: @multiplayer, last_played_at: @last_played_at }
  end
end