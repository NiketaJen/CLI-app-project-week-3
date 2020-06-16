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
         @current_student = existing_student
         puts "Welcome back, #{@current_student.name}."
      else
         @current_student = Student.create({name: @user_name})
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
         @current_student.subjects.each do |subject|
            puts subject.topic 
            puts subject.level_of_difficulty
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
      elsif @users_choice == "2"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         return self.biology_quiz
      elsif @users_choice == "3"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         return self.english_quiz
      end
   end

   def math_quiz
      right_answers = 0

      puts "Question 1"
      puts "12 - 5 ="
      answer1 = gets.chomp()
      if answer1 == "7"
         right_answers += 1
         puts "Correct!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 2"
      puts "14 * 7 ="
      answer2 = gets.chomp()
      if answer2 == "98"
         right_answers += 1
         puts "Great job!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 3"
      puts "A bag has 5 blue marbles, 3 green marbles, and 2 red marbles."
      puts "You pick 4 marbles without looking."
      puts "What is the likelihood of the order being RBGR?"
      puts "1) 1/168"
      puts "2) 1/84"
      puts "3) 3/168"
      puts "4) 1/42"
      answer3 = gets.chomp()
      if answer3 == "1"
         right_answers += 1
         puts "Amazing!"
      else
         puts "Not quite"
      end
      puts ""
      puts "Question 4"
      puts "Which has the smallest value?"
      puts "1) 5/8"
      puts "2) 0.63"
      puts "3) 0.8 * 0.8"
      puts "4) 16/25"
      answer4 = gets.chomp()
      if answer4 == "1"
         right_answers += 1
         puts "Excellent!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 5"
      puts "Which type of triangle has 2 sides of equal length?"
      puts "1) scalene"
      puts "2) equilateral"
      puts "3) isosceles"
      puts "4) right"
      answer5 = gets.chomp()
      if answer5 == "3"
         right_answers += 1
         puts "Great job!"
      else
         puts "Not exactly"
      end
      puts "Oh snap! You got #{right_answers} out of 5 correct answers."
      if right_answers == 0
         Lesson.create({student_id: @current_student.id, subject_id: 40})
      elsif right_answers == 1
         Lesson.create({student_id: @current_student.id, subject_id: 40})
      elsif right_answers == 2
         Lesson.create({student_id: @current_student.id, subject_id: 40})
      elsif right_answers == 3
         Lesson.create({student_id: @current_student.id, subject_id: 41})
      elsif right_answers == 4
         Lesson.create({student_id: @current_student.id, subject_id: 41})
      elsif right_answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 42})
      end
   end

   def biology_quiz
      right_answers = 0

         puts "Question 1"
         puts "Biology is the study of:"
         puts "1) People"
         puts "2) Life"
         puts "3) Studying"
         answer1 = gets.chomp()
         if answer1 == "2"
            right_answers = right_answers + 1
            puts "Correct!"
         else
            puts "Incorrect"
         end
         puts ""
         puts "Question 2"
         puts "All living things are made of:"
         puts "1) Cells"
         puts "2) Money"
         puts "3) I don't know, that's why I'm here"
         answer2 = gets.chomp()
         if answer2 == "1"
            right_answers = right_answers + 1
            puts "Great job!"
         elsif answer2 == "3"
            puts "Well, at least you're honest."
         else
            puts "Incorrect"
         end
         puts ""
         puts "Question 3"
         puts "Which immunoglobulin is dimeric in secretions and passed through colostrum?"
         puts "1) IgM"
         puts "2) IgG2"
         puts "3) IgA"
         puts "4) IgG5"
         answer3 = gets.chomp()
         if answer3 == "3"
            right_answers = right_answers + 1
            puts "That's right!"
         else
            puts "Not quite."
         end
         puts ""
         puts "Question 4"
         puts "Which is characteristic of both prokaryotes and eukaryotes?"
         puts "1) Membrane-bound organelles"
         puts "2) Undergo mitosis"
         puts "3) A true nucleus"
         puts "4) Is that even English?"
         answer4 = gets.chomp()
         if answer4 == "2"
            right_answers = right_answers + 1
            puts "Correct!"
         elsif answer4 == "4"
            puts "Nope! It's actually Greek for 'before kernel' and 'true kernel.'"
         else
            puts "Wrong."
         end 
         puts ""
         puts "Question 5"
         puts "Most mammals go through which birthing process?"
         puts "1) Oviparous"
         puts "2) Viviparous"
         puts "3) Ovoviviparous"
         puts "4) Parthenogenesis"
         answer5 = gets.chomp()
         if answer5 == "2"
            right_answers = right_answers + 1
            puts "Amazing! Did you guess?"
         else
            puts "Yeah, we didn't really expect anyone to get this one right, anyway."
         end
         puts ""
         puts "Oh snap! You got #{right_answers} out of 5 answers correct."
         if right_answers == 0
            Lesson.create({student_id: @current_student.id, subject_id: 43})
         elsif right_answers == 1
            Lesson.create({student_id: @current_student.id, subject_id: 43})
         elsif right_answers == 2
            Lesson.create({student_id: @current_student.id, subject_id: 43})
         elsif right_answers == 3
            Lesson.create({student_id: @current_student.id, subject_id: 44})
         elsif right_answers == 4
            Lesson.create({student_id: @current_student.id, subject_id: 44})
         elsif right_answers == 5
            Lesson.create({student_id: @current_student.id, subject_id: 45})
         end
   end

   def english_quiz
      puts "English Quiz"
   end
end

CLI.new()