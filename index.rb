require_relative './config/environment.rb'
ActiveRecord::Base.logger = nil


class CLI
   
   def initialize
      self.opening_message()
   end

   def opening_message
   puts "Welcome to StudyHelper! We're exicted to help you reach your learning goals."
   puts "Please enter your name"
   @user_name = gets.chomp()
   existing_student = Students.find_by(name: @user_name)
      if (existing_student != nil)
         current_student = existing_student
         "Welcome back, #{current_student}."
      else
         current_student = Student.create({name: @user_name})
         "Looks like you're new here."
      end
      self.option_menu
   end
   
   def option_menu
      puts ""
      puts "What would you like to do?"
      puts "1) Look at my subjects"
      puts "2) Learn a new subject"
      puts "3) Quit"
      user_selects = gets.chomp()
      if user_selects == "1"
         puts ""
         puts "Your subjects"
         current_student.subjects.each do |subject|
            puts subject.topic
            end
      elsif user_selects == "2"
         self.learn_subject
      elsif user_selects == "3"
         puts "Goodbye!"
      end
   end

   def learn_subject
      puts ""
      puts "What subject are you interested in learning?"
      puts "1) Math"
      puts "2) Biology"
      puts "3) English"
      puts "4) Coding"
      puts "5) Back to Previous Menu"
      @users_choice = gets.chomp()
      return self.users_choices
   end

   def users_choices
      if @users_choice == "5"
         return self.option_menu
      elsif @users_choice == "4"
         puts "Error: We're not quite ready to teach coding, yet."
         puts "Maybe you should look into Flatiron, instead."
         return self.learn_subject
      else
         self.quiz_selection
      end
   end

   def quiz_selection
      puts ""
      puts "Before we choose a lesson plan, let's take a quick quiz."
      if @userschoice == "1"
         self.math_quiz
      elsif @userschoice == "2"
         self.biology_quiz
      elsif @userschoice == "3"
         self.english_quiz
      end
   end

   def math_quiz
      puts "Math Quiz"
   end

   def biology_quiz
      puts "Biology Quiz"
   end

   def english_quiz
      puts "English Quiz"
   end
end

CLI.new()