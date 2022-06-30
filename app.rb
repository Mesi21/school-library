require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize(books, rents, people)
    @books = books
    @rents = rents
    @people = people
  end

  def menu
    menu_list = ["Welcome to School Library App!\n\n", 'Please choose an option by entering a number:',
                 '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
                 '5 - Create a rental', '6 - List all rentals for a given person id', "7 - Exit\n\n"]
    menu_list.each do |item|
      puts item.to_s
    end
    gets.chomp
  end

  def run
    num = menu
    case num
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      puts 'Thanks for using this app ...'
      exit
    end
  end
end
