@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end


#all the students put into an array
def input_students #input_students method
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  #create an empty array
  @students = []
  #this will be used to check for spelling
  cohort_month = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"]
  #gets the first name
  name = gets.delete "\r\n"
  #gets the cohort they will be joining
  puts "And the cohort this student will be joining?"
  #intern converts the cohort name to a symbol rather than a string
  cohort = gets.capitalize.delete "\r\n"

  #while the name is NOT empty, repeat this code
  while !name.empty? && !cohort.empty? do
    @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students"
    name = gets.delete "\r\n"
      puts "And cohort?"
    cohort = gets.capitalize.delete "\r\n"#intern converts the cohort string to a symbol
  end
  @students
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

#header method for May
def print_header_selected
  puts "The students of Villains Academy for May"
  puts "--------------"
end

#method to print students in a particular cohort - removed symols though
def print_may(students)
  for student in @students
    if student[:cohort] == "May"
      puts "#{student[:name]}"
    end
  end
  puts "--------------"
end
#body method to print the student names and cohort
#iterates through the students hash and prints 'student's name and cohort
#each_with_index so the index of the name comes before it in a list
def print_students_list(students)
  @students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end

end
#finally, we print the total number of students
#student.count counts the number of elements in the student array

def print_footer(students)
  s = "" #empty variable s
  @students.length == 1 ? s = "" : s ="s" #if 1 student, s = blank
  puts "Overall, we have #{@students.length} great student#{s}"
end
#nothing happens until we call the methods

interactive_menu
print_header_selected if students.length > 0
print_may(students) if students.length > 0
print_header if students.length > 0
print(students) if students.length > 0
print_footer(students) if students.length > 0
