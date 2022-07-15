require 'securerandom'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(title, publish_date, genre, source, on_spotify = true, archived = false, id = SecureRandom.uuid)
    super(title, publish_date, archived, id)
    @on_spotify = on_spotify
    add_genre(genre)
    add_source(source)
  end

  def can_be_archived?
    super == true && on_spotify
  end

  def to_hash
    { id: @id, title: @title, publish_date: @publish_date.strftime('%Y-%m-%d'), archived: @archived,
      on_spotify: @on_spotify, genre: @genre.to_hash, source: @source.to_hash }
  end
end

# music_album = MusicAlbum.new(20, "fjkjjj")
# p music_album.to_hash
# p music_album.can_be_archived?
# music_album.add_genre("Godwin")
# p music_album.genre
