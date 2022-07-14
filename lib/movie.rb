require 'securerandom'
require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent, archived = false, id = SecureRandom.uuid)
    super(publish_date, archived, id)
    @silent = silent
  end

  def can_be_archived?
    super == true || silent
  end

  def to_hash
    { id: @id, publish_date: @publish_date, archived: @archived, silent: @silent }
  end
end

# movie = Movie.new(20, true)
# p movie.to_hash
# p movie.can_be_archived?
# movie.add_label("Godwin")
# p movie.label
