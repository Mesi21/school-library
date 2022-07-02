class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.add_rental << self
    person.add_rental << self
  end

  def add_person(person)
    @person = person
    person.rents.push(self) unless person.rents.include?(self)
  end

  def add_book(book)
    @book = book
    book.add_book.push(self) unless book.rents.include?(self)
  end
end
