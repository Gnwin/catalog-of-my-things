require 'securerandom'
require_relative 'item'
require 'date'
require 'time'


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
    { id: @id, title: @title, publish_date: @publish_date, archived: @archived,
      publisher: @publisher, cover_state: @cover_state, author: @author.to_hash, label: @label.to_hash }
  end
end
