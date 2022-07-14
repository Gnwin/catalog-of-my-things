require 'securerandom'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, archived = false, id = SecureRandom.uuid)
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super == true && on_spotify
  end

  def to_hash
    { id: @id, publish_date: @publish_date, archived: @archived, on_spotify: @on_spotify }
  end
end

# music_album = MusicAlbum.new(20, "fjkjjj")
# p music_album.to_hash
# p music_album.can_be_archived?
# music_album.add_genre("Godwin")
# p music_album.genre
