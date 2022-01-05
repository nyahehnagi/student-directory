@students = [] # array to be accessible to all methods



def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  # print the number of students
  print "Overall, "
  print_number_of_students
end

def print_number_of_students
  if @students.count != 1
    puts "we have #{@students.count} great students"
  else
    puts "we have #{@students.count} great student"
  end
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)

    print "Now, "
    print_number_of_students

    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process_user_input(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  # clear @students
  @students = []
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line

  if !filename.nil? && File.exist?(filename)   # if it is not nil and exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist or nil
    load_students
    puts "Loaded #{@students.count} from default file"
  end
end

def interactive_menu
  loop do
    print_menu
    # read the input and process 
    process_user_input(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu