require 'securerandom'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, label, publish_date, archived, on_spotify, id = SecureRandom.uuid)
    super(genre, author, source, label, publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super == true && on_spotify ? true : false
  end
end
