require 'securerandom'
require_relative 'base'

class Label < Base
  attr_accessor :title, :color

  def initialize(title, color, id = SecureRandom.uuid)
    super(id)
    @title = title
    @color = color
  end

  def add_item(item)
    super(item)
    item.add_label(self)
  end

  def to_hash
    { id: @id, title: @title, color: @color }
  end
end
