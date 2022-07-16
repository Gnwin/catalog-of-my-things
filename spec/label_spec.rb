require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe Label do
  context 'When testing Label class' do
    before :each do
      @label = Label.new('game', 'red', '33')
      @game = Game.new('2022-06-28', true, '2022/07/21')
    end

    it 'Returns an instance of Label' do
      expect(@label).to be_instance_of(Label)
    end

    it 'Has correct name' do
      expect(@label.title).to eq 'game'
    end

    it 'Item adds itself to label.items array' do
      @game.add_label(@label)
      expect(@label.items).not_to be_empty
    end

    it 'Returns correct hash' do
      hash = { id: '33', title: 'game', color: 'red' }
      expect(@label.to_hash).to eq hash
    end
  end
end
