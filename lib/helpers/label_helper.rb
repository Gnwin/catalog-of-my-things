require_relative '../label'

class LabelCreator
  def create_label
    puts 'What would you like your label to read? (Sci-Fi, Adventure, Fantasy)'
    title = gets.chomp

    puts 'What color is the label?'
    color = gets.chomp

    Label.new(title, color)
  end
end
