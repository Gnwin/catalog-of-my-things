require 'securerandom'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, source, label, publish_date, archived, publisher, cover_state, id = SecureRandom.uuid)
    super(genre, author, source, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    result = super
    return true if result == true || cover_state == 'bad'
  end
end
