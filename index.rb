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
         self.option_menu
      else
         @current_student = Student.create({name: @user_name})
         puts "Looks like you're new here."
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
         puts "#{@user_name}'s subjects:"
         @current_student.subjects.each do |subject|
            puts "#{subject.topic} #{subject.id}"
            end
         puts ""
         puts "Please enter the number of the subject you'd like to continue learning."
         puts "Or type return to go back to the main menu."
         continue_subject = gets.chomp()
         if continue_subject == "return"
            self.option_menu
         elsif continue_subject == "40"
            self.math_40
         elsif continue_subject == "41"
            self.math_41
         elsif continue_subject == "42"
            self.math_42
         elsif continue_subject == "43"
            self.bio_43
         elsif continue_subject == "44"
            self.bio_44
         elsif continue_subject == "45"
            self.bio_45
         elsif continue_subject == "46"
            self.eng_46
         elsif continue_subject == "47"
            self.eng_47
         elsif continue_subject == "48"
            self.eng_48
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
         puts ""
         return self.math_quiz
      elsif @users_choice == "2"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         puts ""
         return self.biology_quiz
      elsif @users_choice == "3"
         puts ""
         puts "Before we choose a lesson plan, let's take a quick quiz."
         puts ""
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
      if right_answers < 3
         Lesson.create({student_id: @current_student.id, subject_id: 40})
         puts ""
         puts "You've been placed in math for beginners."
         puts "Let's start with some basics."
         puts ""
         self.math_40
      elsif right_answers < 5
         Lesson.create({student_id: @current_student.id, subject_id: 41})
         puts ""
         puts "Congrats! You've been placed in intermediate math."
         puts "Let's get started."
         puts ""
         self.math_41
      elsif right_answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 42})
         puts ""
         puts "Look out! We've got an expert here."
         puts "Let's see if we can find something you don't know."
         puts ""
         self.math_42
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
         if right_answers < 3
            Lesson.create({student_id: @current_student.id, subject_id: 43})
            puts ""
            puts "You've been placed in biology for beginners."
            puts "Let's start where it all began."
            puts ""
            self.bio_43
         elsif right_answers < 5
            Lesson.create({student_id: @current_student.id, subject_id: 44})
            puts ""
            puts "Congrats! You've been placed in intermediate biology."
            puts "Let's get started."
            puts ""
            self.bio_44
         elsif right_answers == 5
            Lesson.create({student_id: @current_student.id, subject_id: 45})
            puts ""
            puts "Look out! We've got an expert here."
            puts "Let's see if we can find some stuff you don't know."
            puts ""
            self.bio_45
         end
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
      if right_answers < 3
         Lesson.create({student_id: @current_student.id, subject_id: 46})
         puts ""
         puts "You've been placed in English for beginners."
         puts "Let's start with some basics."
         puts ""
         self.eng_46
      elsif right_answers < 5
         Lesson.create({student_id: @current_student.id, subject_id: 47})
         puts ""
         puts "Congrats! You've been placed in to intermediate English"
         puts "Let's get started."
         puts ""
         self.eng_47
      elsif right_answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 48})
         puts ""
         puts "Look out! We've got an expert here."
         puts "Let's see if we can cover some stuff you don't know."
         puts ""
         self.eng_48
      end
   end

   def math_40
      puts "math_40"
   end

   def math_41
      puts "math_41"
   end

   def math_42
      puts "math_42"
   end

   def bio_43
      puts "bio_43"
   end

   def bio_44
      puts "bio_44"
   end

   def bio_45
      puts "bio_45"
   end

   def eng_46
      puts "eng_46"
   end

   def eng_47
      puts "eng_47"
   end

   def eng_48
      puts "eng_48"
   end

end

CLI.new()