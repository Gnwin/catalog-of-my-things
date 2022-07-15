require_relative '../author'

class AuthorCreator
  def create_author
    puts 'Please enter the first name of the author:'
    first_name = gets.chomp

    puts 'Please enter the last name of the author:'
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end
end
