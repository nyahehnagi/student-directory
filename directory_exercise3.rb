# frozen_string_literal: true

# extend String class
class String
  def initial
    chr
  end
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
  students.each_with_index do |student, idx|
    puts "#{idx + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_with_letter(students)
  puts 'Please enter a letter'
  letter = gets.chomp.upcase
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].initial.upcase == letter
  end
end

def print_names_shorter_than(students)
  puts 'Please enter max length for a name'
  length = gets.chomp.to_i
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length <= length
  end
end

def print_footer(names)
  # print the number of students
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty?
    # add the student hash to the array
    students << { name: name, cohort: :november }
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

print_names_shorter_than(students)
