require_relative '../genre'

class GenreCreator
  def create_genre
    puts 'What is the Genre? (Classical, Hip-hop, Jazz)'
    name = gets.chomp

    Genre.new(name)
  end
end
