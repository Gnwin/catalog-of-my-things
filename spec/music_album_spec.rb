require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe MusicAlbum do
  context 'When testing music album class' do
    before :each do
      @genre = Genre.new('Fiction', '33')
      @source = Source.new('Spotify', '33')
      @music_album = MusicAlbum.new('music', '2022-06-28', @genre, @source, true, false, '33')
    end

    it 'Returns an instance of MusicAlbum' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end

    it 'checks that the movie title is correct' do
      expect(@music_album.title).to eq 'music'
    end
  end
end
