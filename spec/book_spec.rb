require 'date'
require_relative '../lib/book'
require_relative '../lib/music_album'
require_relative '../lib/movie'
require_relative '../lib/game'
require_relative '../lib/genre'
require_relative '../lib/label'
require_relative '../lib/author'
require_relative '../lib/source'

describe Book do
  context 'When testing the book class' do
    before :each do
      @title = 'Game of Thrones'
      @publish_date = '2000-01-01'
      @publisher = 'GoT Publishing'
      @cover_state = 'Good'
      @author = Author.new('George', 'Martin', 33)
      @label = Label.new('Fantasy', 'Purple', 33)
      @book_to_test = Book.new(@title, @publish_date, @publisher, @cover_state, @author, @label, false, 33)
    end

    it 'Check to see if variable is assigned to an instance of the book class' do
      @book_to_test.should be_an_instance_of Book
    end

    it 'Tests to see if the book can be archived - but returns false when needed' do
      @book_to_test.publish_date = DateTime.parse('2022-01-01')
      expect(@book_to_test.can_be_archived?).to eq false
    end

    it 'Tests to make sure our test book becomes the correct format in order to store between sessions' do
      actual = { title: 'Game of Thrones', publish_date: '2000-01-01', publisher: 'GoT Publishing', cover_state: 'Good',
                 author: { first_name: 'George', last_name: 'Martin', id: 33 }, label: { title: 'Fantasy', color: 'Purple', id: 33 }, archived: false, id: 33 }
      expect(@book_to_test.to_hash).to eq actual
    end
  end
end