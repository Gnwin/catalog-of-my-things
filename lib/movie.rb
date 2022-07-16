require 'securerandom'
require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(title, publish_date, genre, source, silent = true, archived = false, id = SecureRandom.uuid)
    super(title, publish_date, archived, id)
    @silent = silent
    add_genre(genre)
    add_source(source)
  end

  def can_be_archived?
    super == true || silent
  end

  def to_hash
    { id: @id, title: @title, publish_date: @publish_date, archived: @archived, silent: @silent,
      genre: @genre.to_hash, source: @source.to_hash }
  end
end
