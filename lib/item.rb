require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(genre, author, source, label, publish_date, archived, id = SecureRandom.uuid)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
  end

  def move_to_archive
  end
end
