require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'


describe Game do
  context 'When testing game class' do
    before :each do
      @game = Game.new('The Croods', '2022-06-28', true, false, '33')
    end

    it 'Returns an instance of Game' do
      expect(@game).to be_instance_of(Game)
    end

    it 'checks the game title is correct' do
      expect(@game.title).to eq 'The Croods'
    end
  end
end