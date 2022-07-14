require 'securerandom'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, archived = false, id = SecureRandom.uuid)
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super == true && on_spotify ? true : false
  end

  def to_hash
    { id: @id, publish_date: @publish_date, archived: @archived, on_spotify: @on_spotify }
  end
end
