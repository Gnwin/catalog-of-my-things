require 'securerandom'
require_relative 'base'

class Label < Base
  attr_accessor :title, :color

  def initialize(title, color, id = SecureRandom.uuid)
    super(id)
    @title = title
    @color = color
  end
end

# label = Label.new('Godwin', 'red')

# p label
# p label.id
# p label.title
# p label.color
# label.add_item('jhhjjh')
# p label.items
