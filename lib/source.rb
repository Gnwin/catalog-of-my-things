require 'securerandom'
require_relative 'base'

class Source < Base
  attr_accessor :name

  def initialize(name, id = SecureRandom.uuid)
    super(id)
    @name = name
  end
end
