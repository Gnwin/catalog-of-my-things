require 'securerandom'

class Base
  attr_accessor :items
  attr_reader :id

  def initialize(id = SecureRandom.uuid)
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
