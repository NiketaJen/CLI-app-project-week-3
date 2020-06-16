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
   existing_student = Student.find_by(name: @user_name)
      if (existing_student != nil)
         current_student = existing_student
         puts "Welcome back, #{current_student.name}."
      else
         current_student = Student.create({name: @user_name})
         puts "Looks like you're new here."
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
         puts "Sorry, we're not quite ready to teach coding, yet."
         puts "Maybe you should look into Flatiron, instead."
         return self.learn_subject
      elsif @users_choice == "1"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         return self.math_quiz
      elsif @userschoice == "2"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         return self.biology_quiz
      elsif @userschoice == "3"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         return self.english_quiz
      end
   end

   def math_quiz
      puts "Math Quiz"
   end

   def biology_quiz
      count = 0
      puts "Question 1"
      puts "Biology is the study of:"
      puts "1) People"
      puts "2) Life"
      puts "3) Studying"
      answer1 = gets.chomp()
      if answer1 == "2" || "Life" || "life"
         count += 1
         puts "Correct!"
      else
         "Incorrect"
      end
      puts ""
      puts "Question 2"
      puts "All living things are made of:"
      puts "1) Cells"
      puts "2) Money"
      puts "3) I don't know, that's why I'm here"
      answer2 = gets.chomp()
      if answer2 == "1" || "Cells" || "cells"
         count += 1
         puts "Great job!"
      elsif answer2 == "3" || "I don't know, that's why I'm here"
         puts "Well, at least you're honest."
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 3"
      puts ""
   end

   def english_quiz
      puts "English Quiz"
   end
end

CLI.new()