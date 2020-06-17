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
         "Welcome back, #{current_student}."
         self.option_menu
      else
         current_student = Student.create({name: @user_name})
         "Looks like you're new here."
         self.learn_subject
      end
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
      right_answers = 0

      puts "Question 1"
      puts "Choose the word or phrase that best completes each sentence"
      puts "She was really worried about her final exam, but in the end, she ___ it with no problems."
      puts "1) got through"
      puts "2) got over"
      puts "3) got under"
      puts "4) got on with"
      answer1 = gets.chomp()
      if answer1 == "1"
         right_answers = right_answers + 1
         puts "Correct!"
      else 
         puts "Incorrect"
      end
      puts ""
      puts "Question 2"
      puts "At the end of the speech the whole assembly gave the speakers a standing ..... "
      puts "1) Support"
      puts "2) Applause"
      puts "3) Cheering"
      puts "4) Ovation"
      answer2 = gets.chomp()
      if answer2 == "4"
         right_answers = right_answers + 1
         puts "Excellent Job!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 3"
      puts "Is this sentence correct?"
      puts "To see well, the lights in this room need to be adjusted."
      puts "1) This sentence is correct."
      puts "2) This sentence has a dangling modifier."
      puts "3) This sentence has a coma splice."
      answer3 = gets.chomp()
      if answer3 == "2"
         right_answers = right_answers + 1
         puts "Great Job!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 4"
      puts "Identify the problem with the following paragraph:"
      puts "Elizabeth Peabody was born in a school and thereafter felt destined to be a teacher. Her mother was a teacher and trains her daughters at her side. The academic life seems to suit Elizabeth, who thrived on the rigorous curriculum."
      puts "1) It lacks subject - verb agreement in some sentences."
      puts "2) There are inconsistent shifts in verb tenses"
      puts "3) Punctuation is wrong in the paragraph."
      answer4 = gets.chomp()
      if answer4 == "2"
         right_answers = right_answers + 1
         puts "Correct!"
      else
         puts "Incorrect"
      end
      puts ""
      puts "Question 5"
      puts "Which of the following is correct?"
      puts "1) Current decline in the housing market is often compared to the one in the '80s."
      puts "2) Current decline in the housing market is often compared to the one in the 80's."
      puts "3) Current decline in the housing market is often compared to the one in the 80s."
      answer5 = gets.chomp()
      if answer5 == "1"
         right_answers = right_answers + 1
         puts "Wonderful!"
      else
         puts "Incorrect"
      end
      puts "You got #{right_answers} out of 5 answers correct."
      if right_answers < 2
         Lesson.create({student_id: @current_student.id, subject_id: 46})
      elsif answers >= 2
         Lesson.create({student_id: @current_student.id, subject_id: 47})
      elsif answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 48})
      end
   end
end

CLI.new()