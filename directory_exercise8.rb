# put students into an array of hashes
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    hobbies = "Hobbies: #{student[:hobbies].join(", ")}"
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
    # Enter the cohort
    puts "Please enter cohort, leave blank for default value"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "default"
    end

    # Enter Hobbies
    puts "Please enter the hobbies for #{name}"
    puts "To stop entering hobbies, hit return twice"
    hobbies = []
    hobby = gets.chomp
    while !hobby.empty? do
      hobbies << hobby
      hobby = gets.chomp
    end

    # Check if the user wishes to amend entered details
    puts "Name: #{name}, Cohort: #{cohort}, Hobbies: #{hobbies.join(",")}"
    puts "Are these details correct? if so type 'Y' otherwise type 'N' and re-enter details"
    response = gets.chomp
    if response.upcase == "Y" 
      # add the student hash to the array
      students << {name: name, cohort: cohort.to_sym, hobbies: hobbies}
      puts "Now we have #{students.count} student(s)"
    else
      puts "Student data discarded, please re-enter"
    end

    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_students_by_cohort(students)
  students.map {|student| student[:cohort]}.uniq.each do |cohort|
    puts "Students enrolled in cohort: #{cohort}"
    students.each do |student| 
      if student[:cohort] == cohort
        hobbies = "Hobbies: #{student[:hobbies].join(", ")}"
        puts "#{student[:name].center(20)} #{hobbies.center(20)}"
      end
    end
  end
end

students_test_data = [
  {name: "Bromley Jones", cohort: :november, hobbies: ["Cycling","Gaming"]},
  {name: "Kirsty Edwards", cohort: :default, hobbies: ["Baking"]},
  {name: "Monty Jones", cohort: :default, hobbies: ["Playing"]},
  {name: "Clover Jones", cohort: :november, hobbies: ["Being Cute","Unicorns"]},
  {name: "Callisto Cat", cohort: :november, hobbies: ["Sleeping","Mousing"]}
]

students = input_students
#students = students_test_data
print_header
print_students_by_cohort(students)
print_footer(students)