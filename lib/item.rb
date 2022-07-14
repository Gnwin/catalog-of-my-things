require 'securerandom'

class Item
  attr_reader :genre, :author, :source, :label, :id,
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived = false, id = SecureRandom.uuid)
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) if defined?(@genre.items) && !genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) if defined?(@author.items) && !author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) if defined?(@source.items) && !source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) if defined?(@label.items) && !label.items.include?(self)
  end
end
