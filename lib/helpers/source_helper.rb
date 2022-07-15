require_relative '../source'

class SourceCreator
  def create_source
    puts 'What is the Source? (Amazon Prime, IMDB, Netflix, YouTube)'
    name = gets.chomp

    Source.new(name)
  end
end
