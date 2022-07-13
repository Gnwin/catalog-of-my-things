require 'securerandom'
require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(genre, author, source, label, publish_date, archived, silent, id = SecureRandom.uuid)
    super(genre, author, source, label, publish_date, archived)
    @silent = silent
  end

  def can_be_archived?
    super == true || silent ? true : false
  end
end