require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe Movie do
  context 'When testing the Movie Class and its Methods' do
    before :each do
      @title = 'Spiderman'
      @genre = Genre.new('Fiction', '33')
      @source = Source.new('Disney Plus', '33')
      @publish_date = '2010-01-01'
      @my_movie = Movie.new(@title, @publish_date, @genre, @source, false, false, '33')
    end

    it 'will test that the publish date is 2010-01-01' do
      expect(@my_movie.publish_date).to eq '2010-01-01'
    end

    it 'Tests to make sure our test Movie becomes the correct format in order to store between sessions' do
      actual = { title: 'Spiderman', publish_date: '2010-01-01', genre: { name: 'Fiction', id: '33' }, source: { name: 'Disney Plus', id:'33' }, silent: false, archived: false, id: '33' }
      expect(@my_movie.to_hash).to eq actual
    end
  end
end