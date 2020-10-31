# dickens = ["Charles Dickens", "1870"]
# thackeray = ["William Thackeray", "1863"]
# trollope = ['Anthony Trollope', '1882']
# hopkins = ["Gerard Manley Hopkins", "1889"]
# def died(array)
# name = array[0]
# year = array[1]
# puts  "#{name} died in #{year}."
# end


# puts died(dickens)
# puts died(thackeray)
# puts died(trollope)
# puts died(hopkins)

# class Person
#   def initialize(fname, lname)
#     @first_name = fname
#     @last_name = lname
#   end
#   def full_name
#     @last_name + " " + @first_name
#   end
#   def fname
#     @first_name
#   end
#   def lname
#     @last_name
#   end
# end
# tj = Person.new("Jefferson", "Thomas")
# puts tj.full_name


# Exercise: Find and fix the errors in this code to make it run!

require "pstore"
require "tty-table"

class Employee
  attr_reader :first_name, :last_name, :active, :salary

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

database = PStore.new("employees.store")

while true
  system "clear"
  database.transaction do
    ids = database.roots
    puts "EMPLOYEES (#{ids.length} total)"
    header = ["id", "first_name", "last_name", "salary", "active"]
    rows = ids.map { |id| [id, database[id].first_name, database[id].last_name, database[id].salary, database[id].active] }
    table = TTY::Table.new header, rows
    p table.render(:unicode)
  end
  puts
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
  input_choice = gets.chomp.downcase
  if input_choice == "c"
    print "First name: "
    input_first_name = gets.chomp
    print "Last name: "
    input_last_name = gets.chomp
    print "Salary: "
    input_salary = gets.chomp.to_i
    employee = Employee.new(
      first_name: input_first_name,
      last_name: input_last_name,
      salry: input_salary,
      active: true,
    )
    database.transaction do
      ids = database.roots
      new_id = ids.max.to_i + 1
      database[new_id] = employee
    end
  elsif input_choice == "r"
    print "Employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      employee = database[input]
      pp employee
      puts
      print "Press enter to continue"
      gets.chomp
    end
  elsif input_choice == "u"
    print "Employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      employee = database[input_id]
      print "Update active status (#{employee.active}): "
      input_active = gets.chomp
      if input_active == true
        input_active = true
      elsif input_active == false
        input_active = false
      else
        input_active = nil
      end
      employee.active = input_active
      database[input_id] = employee
    end
  elsif input_choice = "d"
    puts "Delete employee"
    print "Enter employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      database.delete(input_id)
    end
  elsif input_choice == "q"
    puts "Goodbye!"
    return
  else
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end
end