require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe Genre do
  context 'When Testing Genre class' do
    before :each do
      @genre = Genre.new('Fantasy', '33')
      @book = Book.new('love', '2022-06-28', 'Juan.inc', '', '', false, '33')
    end

    it 'Returns instance of Genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'Has correct name' do
      expect(@genre.name).to eq 'Fantasy'
    end

    it 'Item adds itself to genre.items array' do
      @book.add_genre(@genre)
      expect(@genre.items).not_to be_empty
    end
  end
end