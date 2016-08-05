
student = {name: "Naomi Spencer", cohort: :november,
    age: 27, country: "Britian", height: "5ft"}

def print_header
  puts "Please see below profile of a student of villains Academy".center(90)
  puts "____________".center(90)
end

#define printing names method

def print_students(student)
    puts "(This student is called #{student[:name]})
          (They are from the #{student[:cohort]} cohort)
          (This student is #{student[:age]} years old)
          (Their country of birth is #{student[:country]})
          (Their height is #{student[:height]})".lines.map { |line| line.strip.center(90) }.join("\n")
end

def print_footer
  puts "____________".center(90)
  puts "End of student profile".center(90)
end

# nothing happens until we call the methods
student
print_header
print_students(student)
print_footer
