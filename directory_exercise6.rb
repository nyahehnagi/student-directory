# put students into an array of hashes
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    hobbies = "Hobbies: #{student[:hobbies].join(",")}"
    puts "#{student[:name].center(20)} (#{student[:cohort]} cohort) #{hobbies.center(20)}"
  end
end

def print_footer(names)
  # print the number of students
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # Enter Hobbies
    puts "Please enter the hobbies for #{name}"
    puts "To stop entering hobbies, hit return twice"
    hobbies = []
    hobby = gets.chomp
    while !hobby.empty? do
      hobbies << hobby
      hobby = gets.chomp
    end

    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies}
    puts "Now we have #{students.count} student(s)"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)

