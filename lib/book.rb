require 'securerandom'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, archived = false, id = SecureRandom.uuid)
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super == true || cover_state == 'bad'
  end

  def to_hash
    { id: @id, publish_date: @publish_date, archived: @archived, publisher: @publisher, cover_state: @cover_state }
  end
end

# book = Book.new(20, "fjkjjj", "hgh", true)
# p book.to_hash
# p book.can_be_archived?
# book.add_author("Godwin")
# p book.author
