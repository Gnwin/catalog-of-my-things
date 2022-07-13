require 'securerandom'
require_relative 'base'

class Author < Base
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, id = SecureRandom.uuid)
    super(id)
    @first_name = first_name
    @last_name = last_name
  end
end
