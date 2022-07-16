require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe Author do
  context 'When testing Author class' do
    before :each do
      @author = Author.new('hjhhj', 'nnjhjj', '33')
      @label = Label.new('game', 'red', '33')
      @book = Book.new('we', '2022-06-28', 'Juan.inc', 'Good', @author, @label, '33', false)
    end

    it 'Returns instance of Author' do
      expect(@author).to be_instance_of(Author)
    end

    it 'Has correct first name' do
      expect(@author.first_name).to eq 'hjhhj'
    end

    it 'Has correct last name' do
      expect(@author.last_name).to eq 'nnjhjj'
    end

    it 'Item adds itself to author.items array' do
      @book.add_author(@author)
      expect(@author.items).not_to be_empty
    end
  end
end
