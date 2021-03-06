require_relative '../book'
require_relative 'label_helper'
require_relative 'author_helper'

class BookCreator
  def initialize
    @label_creator = LabelCreator.new
    @author_creator = AuthorCreator.new
  end

  def create_a_book
    puts 'Please type the book title'
    title = gets.chomp

    author = @author_creator.create_author

    puts 'Please enter the publish date as YYYY-MM-DD'
    publish_date = gets.chomp

    puts 'Please enter the publisher name'
    publisher = gets.chomp

    puts 'Please enter the book condition (e.g. bad, good, new)'
    cover_state = gets.chomp

    label = @label_creator.create_label

    Book.new(title, publish_date, publisher, cover_state, author, label)
  end
end
