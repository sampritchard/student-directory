#all the students put into an array
students = [
"Dr Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates",
]
#header method
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
#body method to print the student names
#iterates through the students array and prints 'student'
def print(names)
  names.each do |name|
    puts name
  end
end
#finally, we print the total number of students
#student.count counts the number of elements in the student array
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
