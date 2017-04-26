#TO DO-
#Check for spelling errors
#create a default value if no month entered

#all the students put into an array
def input_students #input_students method
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  #create an empty array
  students = []
  #this will be used to check for spelling
  cohort_month = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"]
  #gets the first name
  name = gets.chomp
  #gets the cohort they will be joining
  puts "And the cohort this student will be joining?"
  #intern converts the cohort name to a symbol rather than a string
  cohort = gets.chomp.capitalize.intern

  #while the name is NOT empty, repeat this code
  while !name.empty? && !cohort.empty? do
    students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
    name = gets.chomp
      puts "And cohort?"
    cohort = gets.chomp.capitalize.intern #intern converts the cohort string to a symbol
  end
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
  s = "" #empty variable s
  students.length == 1 ? s = "" : s ="s" #if 1 student, s = blank
  puts "Overall, we have #{students.length} great student#{s}"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
