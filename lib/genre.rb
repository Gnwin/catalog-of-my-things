require 'securerandom'
require_relative 'base'

class Genre < Base
  attr_accessor :name

  def initialize(name, id = SecureRandom.uuid)
    super(id)
    @name = name
  end

  def add_item(item)
    super(item)
    item.add_genre(self)
  end

  def to_hash
    { id: @id, name: @name }
  end
end

# genre = Genre.new('Godwin')

# p genre
# p genre.id
# p genre.name
# genre.add_item('jhhjjh')
# p genre.items
