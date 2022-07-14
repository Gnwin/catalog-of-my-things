require_relative 'book'
require_relative 'music_album'
require_relative 'movies'
require_relative 'games'
require_relative 'genres'
require_relative 'labels'
require_relative 'authors'
require_relative 'sources'

require_relative '../helpers/app_helper'
require_relative 'rental'
require_relative '../data/storage'
require 'json'
require 'pry'

class App
  # include AppHelper
  attr_accessor :books, :people, :rentals

  @@store = Store.new

  @@booksdata = @@store.read('books', './data/books.json')
  @@booksdata = [] if @@booksdata.nil?
  @@booksdata = @@booksdata.map do |book|
    Book.new(book['title'], book['author'])
  end

  @@peopledata = @@store.read('people', './data/people.json')
  @@peopledata = [] if @@peopledata.nil?
  @@peopledata = @@peopledata.map do |person|
    case person['class_name']
    when 'Student'
      Student.new(person['name'], person['age'], person['classroom'], person['parent_permission'], person['id'])
    when 'Teacher'
      Teacher.new(person['name'], person['age'], person['specialization'], person['parent_permission'], person['id'])
    end
  end

  def initialize
    @books = @@booksdata
    @people = @@peopledata
    @rentals = []
  end

  def list_all_books
    puts 'No books here, pick a number to create a book' if @books.empty?
    @books.each { |book| puts "[Book] Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  def list_all_people
    puts 'No people here, pick a number to create a person' if @people.empty?
    @people.each do |person|
      puts "[Student] Name: #{person.name}, Age: #{person.age}" if person.class_name == 'Student'
      puts "[Teacher] Name: #{person.name}, Age: #{person.age}" if person.class_name == 'Teacher'
    end
  end

  def create_person
    class_name = confirm_class
    specialty = confirm_specialty(class_name)
    age = confirm_age

    puts "please enter this Person's name"
    name = gets.chomp
    permission = confirm_permission(class_name)

    if class_name == 'Teacher'
      teacher = Teacher.new(name, age, specialty)
      puts "Created Teacher Name: #{name} Age: #{age} Specialty: #{specialty} ID: #{teacher.id}"
      @people << teacher
    else
      student = Student.new(name, age, '', permission)
      puts "Created Student Name: #{name} Age: #{age} ID: #{student.id}"
      @people << student
    end
  end

  def create_book
    puts 'title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts "Book made. #{title} by #{author}"

    @books << book
  end

  def create_rental
    if @people.empty?
      puts 'We need a person to rent to! Please add a person before setting up a rental'
      return ''
    end
    if @books.empty?
      puts 'We need a book to rent out! Please add a book before setting up a rental'
      return ''
    end
    person_selection_idx = make_person_selection
    book_selection_idx = make_book_selection
    book = @books[book_selection_idx]
    person = @people[person_selection_idx]
    puts 'please enter a date in format YYYY-MM-DD'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def list_all_rentals
    puts 'No rentals currently' if @rentals.empty?
    unless @rentals.empty? # rubocop:disable Style/GuardClause
      search_id = find_id
      filtered = @rentals.select { |rental| rental.person.id == search_id }
      filtered.each do |rental|
        puts "Rental Details - Date: #{rental.date} Book: #{rental.book.title}
      \sby #{rental.book.author} Rented by: #{rental.person.name}"
      end
    end
  end
end
