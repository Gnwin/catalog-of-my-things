require 'securerandom'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publish_date, publisher, cover_state, author, label, archived = false, id = SecureRandom.uuid)
    super(title, publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
    add_author(author)
    add_label(label)
  end

  def can_be_archived?
    return true if super == true || cover_state == 'bad'

    false
  end

  def to_hash
    { id: @id, title: @title, publish_date: @publish_date.strftime('%Y-%m-%d'), archived: @archived,
      publisher: @publisher, cover_state: @cover_state, author: @author.to_hash, label: @label.to_hash }
  end
end

# book = Book.new(20, "fjkjjj", "hgh", true)
# p book.to_hash
# p book.can_be_archived?
# book.add_author("Godwin")
# p book.author
