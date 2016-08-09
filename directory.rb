def input_students
# students name
 puts "Please enter the names of the students"
#create an empty array
 students = []
  # get the first name
  name = gets.chomp


  while !name.empty? do
    puts "Please enter the students cohort"
    # get the first name
    month = gets.chomp
    until ["January",
                  "February",
                  "March",
                  "April",
                  "May",
                  "June",
                  "July",
                  "August",
                  "September",
                  "October",
                  "November",
                  "December"
      ].include?(month)
      puts "Please put correct month"
      month = gets.chomp
    end
    # while the name is not empty, repeat this code
      if month == ""
        month = "January"
      end
  # add the student hash to the array
      students << {name: name, cohort: month.to_sym}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp

  end
  students
end

def print_header
  puts "Please see below profile of a student of villains Academy".center(90)
  puts "____________".center(90)
end

#define printing names method

def print_students(student)
    puts student.group_by { |entry| entry[:cohort] }
end

def print_footer
  puts "____________".center(90)
  puts "End of student profile".center(90)
end




# nothing happens until we call the methods
# nothing happens until we call the methods
students = input_students
print_students(students)
