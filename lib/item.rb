require 'securerandom'
require 'date'

class Item
  attr_reader :title, :genre, :author, :source, :label, :id
  attr_accessor :publish_date, :archived

  def initialize(title, publish_date, archived = false, id = SecureRandom.uuid)
    @id = id
    @title = title
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
    @genre.items.push(self)
  end

  def add_author(author)
    @author = author
    @author.items.push(self)
  end

  def add_source(source)
    @source = source
    @source.items.push(self)
  end

  def add_label(label)
    @label = label
    @label.items.push(self)
  end
end
