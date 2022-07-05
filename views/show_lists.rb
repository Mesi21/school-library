
class ShowList
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
end