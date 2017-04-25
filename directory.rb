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
#then print them
puts "The students of Villains Academy"
puts "--------------"
#iterates through the students array and prints 'student'
students.each do |student|
  puts student
end
#finally, we print the total number of students
#student.count counts the number of elements in the student array
puts "Overall, we have #{students.count} great students"
