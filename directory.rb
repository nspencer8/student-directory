@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Input successful"
  when "2"
    show_students
    puts "Input successful"
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
    puts "Input successful"
  when "4"
    load_students
    puts "Input successful"
  else
    puts "I don't know what you meant, try again"
  end
end

def input_into_array(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
  end

# option 1
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name and string alternative to .chomp
  name = STDIN.gets.delete("\n")
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "cohort?"
    cohort = STDIN.gets.chomp
    cohort == "" ? cohort = "august" : cohort
    input_into_array(name, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

# option 2
def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# option 3
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# option 4
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
      input_into_array(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end



try_load_students
load_students
interactive_menu
