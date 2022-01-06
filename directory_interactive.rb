@students = [] # array to be accessible to all methods

# using lambda more to see how it works than anything else.
@user_options = {
  "1" => ->{ input_students },
  "2" => ->{ show_students },
  "3" => ->{ save_students },
  "4" => ->{ load_students },
  "9" => ->{ exit }
}

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
  puts "#{name} succesfully added"
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
    puts "3. Save students to file"
    puts "4. Load students from file"
    puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process_user_input(selection)
  # Is a process available for the selected made?
  if @user_options.key?(selection) 
     @user_options[selection].call 
  else
      puts "Invalid option, please try again"
  end
end

def get_filename_from_user
  puts "Please enter filename"
  STDIN.gets.chomp
end

def save_students
  # open file for writing
  save_file = get_filename_from_user
  file = File.open(save_file, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end

  puts "Sucessfully saved students to #{save_file}"
end

def load_students
  load_file = get_filename_from_user
  load_students_from_file(load_file)
end

def load_students_from_file(filename = "students.csv")
  # clear @students
  @students = []

  File.foreach(filename) do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end

  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line

  if !filename.nil? && File.exist?(filename)   # if it is not nil and exists
    load_students_from_file(filename)
  else # if it doesn't exist or nil, call with defaul values
    load_students_from_file
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