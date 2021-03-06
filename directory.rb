@students = []

def input_students #input_students method
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  #create an empty array
  @students = []
  #gets the first name
  name = STDIN.gets.delete "\r\n"
  #gets the cohort they will be joining
  puts "And the cohort this student will be joining?"
  cohort = STDIN.gets.capitalize.delete "\r\n"
  #while the name is NOT empty, repeat this code
    while !name.empty? && !cohort.empty? do
      @students << {name: name, cohort: cohort}
        puts "Now we have #{@students.count} students"
          name = STDIN.gets.delete "\r\n"
        puts "And cohort?"
          cohort = STDIN.gets.capitalize.delete "\r\n"
    end
  @students
end

def save_students
  p "Which file do you want to save these changes to?"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    #open the file for writing
    file = File.open("filename", "w")
      @students.each do |student|
        student_data = [student[:name], student [:cohort]]
          csv_line = student_data.join(",")
        file.puts csv_line
      end
    p "These changes have been saved"
    file.close
  else
    p "That file doesn't seem to exist.."
  end
end

def load_students(filename = "students.csv")
  #load the file for reading hence the "r"
  file = File.open("students.csv", "r")
  #read all lines in the array and iterate over it
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
  file.close
end

def try_load_students
  filename = ARGV.first
    if filename.nil?
      load_students()
    elsif File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    puts "You selected option 1"
    input_students
  when "2"
    puts "You selected option 2"
    show_students
  when "3"
    puts "You selected option 3"
    save_students
  when "4"
    puts "You selected option 4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

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
  puts "--------------"
  puts "Overall, we have #{@students.length} great student#{s}"
end
#nothing happens until we call the methods
try_load_students
interactive_menu
