#all the students put into an array
#changed the students and put them into a hash so easier to read when called
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  #create an empty array
  students = []
  #gets the first name
  name = gets.chomp
  #while the name is NOT empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

students = [
{name: "Dr Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
#header method
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
#body method to print the student names and cohort
#iterates through the students hash and prints 'student's name and cohort
#each_with_index so the index of the name comes before it in a list
def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#finally, we print the total number of students
#student.count counts the number of elements in the student array
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_specifc_letter_names(students)
print_footer(students)
