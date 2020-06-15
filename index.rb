require_relative './config/environment'
class CLI
puts "Welcome to StudyHelper! We're exicted to help you reach your learning goals."
puts "Please enter your name"
 @user_name = gets.chomp
 existing_student = Student.find_by({name: @user_name})
 if (exisiting_student != nil)
    current_student = existing_student
 else
    current_student = Student.create({name: @user_name})
 end

 done = false
 while done == false
puts ""
puts "What would you like to do?"
puts "1) Look at my subjects"
puts "2) Learn a new subject"
puts "3) Quit"

end

# #prompted when student selects they are interested in a new subject
#     puts "What subject are you interested in learning?"
#     puts "1) Math"
#     puts "2) Biology"
#     puts "3) English"
#     puts "4) Coding"
#     puts "5) Exit"
#     users_choice == gets.chomp()
#     if users_choice == "1"
#         puts ""
#         puts # asks questions pertaining to level of difficulty needs another if /end statement
#     elsif users_choice == "2"
#         puts ""
#         puts # asks questions pertaining to level of difficulty needs another if /end statement
#     elsif users_choice == "3"
#         puts ""
#         puts # asks questions pertaining to level of difficulty needs another if /end statement
#     elsif users_choice == "4"
#         puts ""
#         puts # asks questions pertaining to level of difficulty needs another if /end statement
#     elsif users_choice == "5"
#         #done = true
#     end


# end
  


 end