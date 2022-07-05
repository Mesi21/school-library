require '../rental'

class CreateRental
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
