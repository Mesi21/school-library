class CreatePerson
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
end
