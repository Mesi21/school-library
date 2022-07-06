require './person'
require './student'
require './teacher'
require './book'
require './rental'
require './views/show_lists'

class App
  def initialize()
    @books = []
    @rents = []
    @people = []
    @show = ShowList.new
  end

  def menu
    menu_list = ['Please choose an option by entering a number:',
                 '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
                 '5 - Create a rental', '6 - List all rentals for a given person id', "7 - Exit\n\n"]
    menu_list.each do |item|
      puts item
    end
    gets.chomp.to_s
  end

  def run
    num = menu
    case num
    when '1'
      make_list_all_books
    when '2'
      make_list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals_for_id
    else
      puts 'Thanks for using this app ...'
      exit
    end
  end

  def make_list_all_books
    @show.make_list_all_books(@books)
  end

  def make_list_all_people
    @show.make_list_all_people(@people)
  end

end
