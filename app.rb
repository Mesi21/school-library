require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize()
    @books = []
    @rents = []
    @people = []
  end

  def menu
    menu_list = ["Welcome to School Library App!\n\n", 'Please choose an option by entering a number:',
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

  def list_all_books
    @books.each_with_index do |book, idx|
      puts "#{idx} Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each_with_index do |person, idx|
      puts "#{idx} [#{person.class.name}] Name: #{person.name} Age: #{person.age} ID: #{person.id}}"
    end
  end

  def list_all_rentals_for_id
    puts 'Please add a rental first.' if @rents.empty?
    puts "\n Person\'s ID: "
    p_id = gets.chomp.to_i
    rentals_list = @rents.select { |rental| rental.person.id == p_id }
    if rentals_list.empty?
      puts 'No rentals found for this person.'
    else
      rentals_list.each do |rental|
        puts "Date: #{rental.date}, Book:\"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def make_list_all_books
    list_all_books
    puts 'Press enter to continue ...'
    gets.chomp
    run
  end

  def make_list_all_people
    list_all_people
    puts "\n\nPress any key to continue"
    gets
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    print @people
  end

  def permit(_letter)
    'N' ? false : true
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    agree = gets.chomp
    student = Student.new(age, name, permit(agree), nil)
    @people.push(student)
    print @people
  end

  def create_person
    print "\n Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    user_input = gets.chomp.to_i
    case user_input.to_s
    when '1'
      create_student
    when '2'
      create_teacher
    else
      print 'Please input a correct number!'
      create_person
    end
    puts "Person created successfully\n"
    gets
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "Book created successfully\n"
    run
  end

  def create_rental
    puts "\nSelect a book from the following list by number"
    list_all_books
    book_index = gets.chomp
    puts "\nSelect a person from the following list by number"
    list_all_people
    person_idx = gets.chomp
    print "\n Date(yyyy/mm/dd): "
    rental_date = gets.chomp
    curr_rent = Rental.new(rental_date, @people[person_idx.to_i], @books[book_index.to_i])
    @rents.push(curr_rent)
    puts 'Rental added successfully'
    run
  end
end
