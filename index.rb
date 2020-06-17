require_relative './config/environment.rb'
require 'tty-prompt'
ActiveRecord::Base.logger = nil


class CLI
   
   def initialize
       a = Artii::Base.new :font => 'slant'
      puts a.asciify('Study Helper').blue
      self.opening_message()
   end

#    def slowly
#       yield.each_char { |c| putc c; $stdout.flush; sleep 0.10 }
#   end

   def opening_message
   puts ""
   puts "Welcome to Study Helper! We're exicted to help you reach your learning goals."
   puts ""
   puts "Please enter your name".light_blue
   @user_name = gets.chomp()
   existing_student = Student.find_by(name: @user_name)
      if (existing_student != nil)
         @current_student = existing_student
         puts ""
         puts "Welcome back, #{@current_student.name}.".yellow
         self.option_menu
      else
         @current_student = Student.create({name: @user_name})
        puts "Looks like you're new here.".yellow
         self.learn_subject
      end
   end

   
   def option_menu
      puts ""
      option_menu_prompt = TTY::Prompt.new()
      choices = {"Look at my subjects" => 1,  'Learn a new subject' => 2, "Quit" => 3}
      @options = option_menu_prompt.select("What would you like to do?", choices)
      # puts "What would you like to do?"
      # puts "1) Look at my subjects"
      # puts "2) Learn a new subject"
      # puts "3) Quit"
      # user_selects = gets.chomp()
      if @options == 1
         puts ""
         puts "#{@user_name}'s subjects:"
         # @current_student.subjects.each do |subject|
         #    puts "#{subject.id} #{subject.topic} #{subject.level_of_difficulty}"
         #    end
         # puts ""
         # puts "Please enter the number of the subject you'd like to continue learning."
         # puts "Or type return to go back to the main menu."
         # continue_subject = gets.chomp()
         continue_subject_prompt = TTY::Prompt.new()
         continue_subject = continue_subject_prompt.select("Choose your subject") do |menu|
            @current_student.subjects.each do |subject|
               menu.choice "#{subject.id} #{subject.topic} #{subject.level_of_difficulty}", subject.id
            end
            menu.choice "return", "return"
         end
         if continue_subject == "return"
            self.option_menu
         elsif continue_subject == 40
            self.math_40
         elsif continue_subject == 41
            self.math_41
         elsif continue_subject == 42
            self.math_42
         elsif continue_subject == 43
            self.bio_43_part_2
         elsif continue_subject == 44
            self.bio_44
         elsif continue_subject == 45
            self.bio_45
         elsif continue_subject == 46
            self.eng_46
         elsif continue_subject == 47
            self.eng_47
         elsif continue_subject == 48
            self.eng_48
         end
      elsif @options == 2
         self.learn_subject
      elsif @options == 3
         puts "Goodbye!"
      end
   end

   def learn_subject
      puts ""
      learn_subject_prompt = TTY::Prompt.new()
      choices = {"Math" => 1,  'Biology' => 2, "English" => 3, "Coding" => 4, "Back to Previous Menu" => 5}
      @users_choice = learn_subject_prompt.select("What subject are you interested in learning?", choices)
      return self.users_choices
   end

   def learn_subject_new_user
      puts ""
      learn_subject_prompt = TTY::Prompt.new()
      choices = {"Math" => 1,  'Biology' => 2, "English" => 3, "Coding" => 4}
      @users_choice = learn_subject_prompt.select("What subject are you interested in learning?", choices)
      return self.users_choices
   end

   def users_choices
      if @users_choice == 5
         return self.option_menu
      elsif @users_choice == 4
         puts "Sorry, we're not quite ready to teach coding, yet."
         puts "Maybe you should look into Flatiron, instead."
         return self.learn_subject
      elsif @users_choice == 1
         # existing_subject = Lesson.where(student_id: @current_student.id, subject_id: 40)
         # if (existing_subject != nil)
         #    puts "It looks like you're already learning this subject."
         #    puts ""
         #    continue_studying_prompt = TTY::Prompt.new()
         #    continue_studying = continue_studying_prompt.select("Would you like to continue studying?", %w(yes no))
         #    # puts "Would you like to continue studying?"
         #    # puts "Yes / No"
         #    # yes_or_no = gets.chomp()
         #    if continue_studying == "no"  #|| yes_or_no == "no" || yes_or_no == "NO"
         #       return self.option_menu
         #    else
         #       return self.math_40
         #    end
         # else
            puts ""
            puts "Before we choose a lesson plan, let's take a quick quiz."
            puts ""
            return self.math_quiz
         
      elsif @users_choice == 2
         # existing_beginner_subject = Lesson.where(student_id: @current_student.id, subject_id: 43)
         # existing_intermediate_subject = Lesson.where(student_id: @current_student.id, subject_id: 44)
         # existing_expert_subject = Lesson.where(student_id: @current_student.id, subject_id: 45)
         # if (existing_beginner_subject != nil && existing_intermediate_subject != nil && existing_expert_subject != nil)
         #    puts "It looks like you're already learning this subject."
         #    puts ""
         #    continue_studying_prompt = TTY::Prompt.new()
         #    continue_studying = continue_studying_prompt.select("Would you like to continue studying?", %w(yes no))
         #    # puts "Would you like to continue studying?"
         #    # puts "Yes / No"
         #    # yes_or_no = gets.chomp()
         #    if continue_studying == "no" 
         #       return self.option_menu
         #    else
         #       return self.bio_43_part_2
         #    end
         # else
            puts ""
            puts "Before we choose a lesson plan, let's take a quick quiz."
            puts ""
            return self.biology_quiz
         
      elsif @users_choice == 3
         # existing_beginner_subject = Lesson.where(student_id: @current_student.id, subject_id: 46 )
         # existing_intermediate_subject = Lesson.where(student_id: @current_student.id, subject_id: 47 )
         # existing_expert_subject = Lesson.where(student_id: @current_student.id, subject_id: 48)
         # if (existing_beginner_subject != nil && existing_intermediate_subject != nil && existing_expert_subject != nil)
         #    puts "It looks like you're already learning this subject."
         #    puts ""
         #    continue_studying_prompt = TTY::Prompt.new()
         #    continue_studying = continue_studying_prompt.select("Would you like to continue studying?", %w(yes no))
            
         #    if continue_studying == "no" 
         #       return self.option_menu
         #    else
         #       return self.eng_46
         #    end
         # else
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
         puts "Correct!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 2"
      puts "14 * 7 ="
      answer2 = gets.chomp()
      if answer2 == "98"
         right_answers += 1
         puts "Great job!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 3"

      puts "A bag has 5 blue marbles, 3 green marbles, and 2 red marbles."
      puts "You pick 4 marbles without looking."
      question_3_prompt = TTY::Prompt.new()
      choices = {"1/168" => 1,  '1/84' => 2, "3/168" => 3, "1/42" => 4}
      answer3 = question_3_prompt.select("What is the likelihood of the order being RBGR?", choices)

      if answer3 == 1
         right_answers += 1
         puts "Amazing!".green
      else
         puts "Not quite".red
      end
      puts ""
      puts "Question 4"
      question_4_prompt = TTY::Prompt.new()
      choices = {"5/8" => 1,  '0.63' => 2, "0.8 * 0.8" => 3, "16/25" => 4}
      answer4 = question_4_prompt.select("Which has the smallest value?", choices)
     
      if answer4 == 1
         right_answers += 1
         puts "Excellent!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 5"
      question_5_prompt = TTY::Prompt.new()
      choices = {"scalene" => 1,  'equilateral' => 2, "isosceles" => 3, "right" => 4}
      answer5 = question_5_prompt.select("Which type of triangle has 2 sides of equal length?", choices)
      if answer5 == 3
         right_answers += 1
         puts "Great job!".green
      else
         puts "Not exactly".red
      end
      puts "Oh snap! You got #{right_answers} out of 5 correct answers.".light_blue
      if right_answers < 3
         Lesson.create({student_id: @current_student.id, subject_id: 40})
         puts ""
         puts "You've been placed in beginner math.".yellow
         puts "Let's start with some basics.".yellow
         puts ""
         self.math_40
      elsif right_answers < 5
         Lesson.create({student_id: @current_student.id, subject_id: 41})
         puts ""
         puts "Congrats! You've been placed in intermediate math.".yellow
         puts "Let's get started.".yellow
         puts ""
         self.math_41
      elsif right_answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 42})
         puts ""
         puts "Look out! We've got an expert here.".yellow
         puts "Let's see if we can find something you don't know.".yellow
         puts ""
         self.math_42
      end
   end

   def biology_quiz
      right_answers = 0

         puts "Question 1"
         question_1_prompt = TTY::Prompt.new()
         choices = {"People" => 1,  'Life' => 2, "Studying" => 3}
         answer1 = question_1_prompt.select("Biology is the study of:", choices)
         if answer1 == 2
            right_answers = right_answers + 1
            puts "Correct!".green
         else
            puts "Incorrect".red
         end
         puts ""
         puts "Question 2"
         question_2_prompt = TTY::Prompt.new()
         choices = {"Cells" => 1,  'Money' => 2, "I don't know, that's why I'm here" => 3}
         answer2 = question_2_prompt.select("All living things are made of:", choices)
         if answer2 == 1
            right_answers = right_answers + 1
            puts "Great job!".green
         elsif answer2 == 3
            puts "Well, at least you're honest.".red
         else
            puts "Incorrect".red
         end
         puts ""
         puts "Question 3"
         question_3_prompt = TTY::Prompt.new()
         choices = {"IgM" => 1,  'IgG2' => 2, "IgA" => 3, "IgG5" => 4}
         answer3 = question_3_prompt.select("Which immunoglobulin is dimeric in secretions and passed through colostrum?", choices)
   
         if answer3 == 3
            right_answers = right_answers + 1
            puts "That's right!".green
         else
            puts "Not quite.".red
         end
         puts ""
         puts "Question 4"
         question_4_prompt = TTY::Prompt.new()
         choices = {"Membrane-bound organelles" => 1,  'Undergo mitosis' => 2, "A true nucleus" => 3, "Is that even English?" => 4}
         answer4 = question_4_prompt.select("Which is characteristic of both prokaryotes and eukaryotes?", choices)
       
         if answer4 == 2
            right_answers = right_answers + 1
            puts "Correct!".green
         elsif answer4 == 4
            puts "Nope! It's actually Greek for 'before kernel' and 'true kernel.'".red
         else
            puts "Wrong.".red
         end 
         puts ""
         puts "Question 5"
         question_5_prompt = TTY::Prompt.new()
         choices = {"Oviparous" => 1,  "Viviparous" => 2, "Ovoviviparous" => 3, "Parthenogenesis" => 4}
         answer5 = question_5_prompt.select("Most mammals go through which birthing process?", choices)
        
         if answer5 == 2
            right_answers = right_answers + 1
            puts "Amazing! Did you guess?".green
         else
            puts "Yeah, we didn't really expect anyone to get this one right, anyway.".red
         end
         puts ""
         puts "Oh snap! You got #{right_answers} out of 5 answers correct.".light_blue
         if right_answers < 3
            Lesson.create({student_id: @current_student.id, subject_id: 43})
            puts ""
            puts "You've been placed in beginner biology.".yellow
            puts "Let's start where it all began.".yellow
            puts ""
            self.bio_43_part_1
         elsif right_answers < 5
            Lesson.create({student_id: @current_student.id, subject_id: 44})
            puts ""
            puts "Congrats! You've been placed in intermediate biology.".yellow
            puts "Let's get started.".yellow
            puts ""
            self.bio_44
         elsif right_answers == 5
            Lesson.create({student_id: @current_student.id, subject_id: 45})
            puts ""
            puts "Look out! We've got an expert here.".yellow
            puts "Let's see if we can find some stuff you don't know.".yellow
            puts ""
            self.bio_45
         end
   end

   def english_quiz
      right_answers = 0
      puts "Question 1"
      puts "Choose the word or phrase that best completes each sentence"
      question_1_prompt = TTY::Prompt.new()
      choices = {"got through" => 1,  "got over" => 2, "got under" => 3, "got on with" => 4}
      answer1 = question_1_prompt.select("She was really worried about her final exam, but in the end, she ___ it with no problems.", choices)
   
      if answer1 == 1
         right_answers = right_answers + 1
         puts "Correct!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 2"
      question_2_prompt = TTY::Prompt.new()
      choices = {"Support" => 1,  "Applause" => 2, "Cheering" => 3, "Ovation" => 4}
      answer2 = question_2_prompt.select("At the end of the speech the whole assembly gave the speakers a standing ..... ", choices)
     
      if answer2 == 4
         right_answers = right_answers + 1
         puts "Excellent Job!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 3"
      puts "Is this sentence correct?"
      question_3_prompt = TTY::Prompt.new()
      choices = {"This sentence is correct." => 1,  "This sentence has a dangling modifier." => 2, "This sentence has a comma splice." => 3}
      answer3 = question_3_prompt.select("To see well, the lights in this room need to be adjusted.", choices)

      if answer3 == 2
         right_answers = right_answers + 1
         puts "Great Job!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 4"
      puts "Identify the problem with the following paragraph:"
      question_4_prompt = TTY::Prompt.new()
      choices = {"It lacks subject - verb agreement in some sentences." => 1,  "There are inconsistent shifts in verb tenses" => 2, "Punctuation is wrong in the paragraph." => 3}
      answer4 = question_4_prompt.select("Elizabeth Peabody was born in a school and thereafter felt destined to be a teacher. Her mother was a teacher and trains her daughters at her side. The academic life seems to suit Elizabeth, who thrived on the rigorous curriculum.", choices)
     
      if answer4 == 2
         right_answers = right_answers + 1
         puts "Correct!".green
      else
         puts "Incorrect".red
      end
      puts ""
      puts "Question 5"
      question_5_prompt = TTY::Prompt.new()
      choices = {"Current decline in the housing market is often compared to the one in the '80s." => 1,  "Current decline in the housing market is often compared to the one in the 80's." => 2, "Current decline in the housing market is often compared to the one in the 80s." => 3}
      answer5 = question_5_prompt.select("Which of the following is correct?", choices)
    
      if answer5 == 1
         right_answers = right_answers + 1
         puts "Wonderful!".green
      else
         puts "Incorrect".red
      end
      puts "You got #{right_answers} out of 5 answers correct.".light_blue
      if right_answers < 3
         Lesson.create({student_id: @current_student.id, subject_id: 46})
         puts ""
         puts "You've been placed in beginner English.".yellow
         puts "Let's start with some basics.".yellow
         puts ""
         self.eng_46
      elsif right_answers < 5
         Lesson.create({student_id: @current_student.id, subject_id: 47})
         puts ""
         puts "Congrats! You've been placed in intermediate English".yellow
         puts "Let's get started.".yellow
         puts ""
         self.eng_47
      elsif right_answers == 5
         Lesson.create({student_id: @current_student.id, subject_id: 48})
         puts ""
         puts "Look out! We've got an expert here.".yellow
         puts "Let's see if we can cover some stuff you don't know.".yellow
         puts ""
         self.eng_48
      end
   end

   def math_40
      puts ""
      puts "Welcome to Math 40!"
   end

   def math_41
      puts "math_41"
      puts "Lesson 1: Cancelling or Converting Units "
      puts "To convert between units, you're usually given one measure and asked to convert another measure. For instance, you'll be given some volume in 'gallons' and be asked to convert the volume to 'fluid ounces'. They will have given you the conversion units that are suitable to the task. In these simple scenarios, all you have to do to convert is remember a fairly simple rule:"
      puts "going to smaller units means going to bigger numbers, so multiply"
      puts "going to bigger units means, going to smaller numbers, so divide"
      puts ""
      puts "Here's how it works"
      puts ""
      puts "Convert 3 gallons to quarts"
      puts ""
      puts "Quarts are smaller than gallons; every gallon has 4 quarts. Since I'm converting from a larger unit(gallons) to a smaller unit(quarts), my answer needs to be a bigger number. So I multiply:"
      puts "(3)(4) = 12"
      puts "Then:"
      puts ""
      puts "Answer: 12 quarts"
   end

   def math_42
      puts ""
      puts "Welcome to Math 42!"
   end

   def bio_43_part_1
      puts ""
      puts "Welcome to Beginner Biology!".light_blue
      puts ""
      self.slowly do
      puts "Everything in the world can be placed into one of two categories:"
      puts "Biotic or Abiotic"
      puts "Abiotic means 'non-living.' In this case, it means things that were never alive."
      puts "Things like mountains, water, or the sky."
      puts "Conversely, biotic means 'living,' and that includes anything that's ever lived."
      puts "That could be lions, bacteria, people, or even the flowers I forgot to water last week that have since passed."
      puts "Though this encompasses vastly different types of life from whales to mushrooms and trees to protists,"
      puts "there are shared traits among all of them.  Perhaps none as important as DNA."
      puts ""
      end
      continue_studying_prompt = TTY::Prompt.new()
      continue_studying = continue_studying_prompt.select("Would you like to continue studying?", %w(yes no))
      if continue_studying_prompt == "no" 
         return self.option_menu
      else continue_studying_prompt == "yes" 
         return self.bio_43_part_2
      end
   end

   def bio_43_part_2
      puts ""
      puts "DNA is the genetic material that makes you, you and makes me, me."
      puts "It makes an elephant an elephant and a flower a flower."
      puts "Despite how different these things may seem, their DNA is actually the same."
      puts "The only difference is in how it's expressed."
      puts ""
      continue_studying_prompt = TTY::Prompt.new()
      continue_studying = continue_studying_prompt.select("Continue reading?", %w(yes no back))

      # puts "Continue reading? Yes / No"
      puts "Select 'back' to go to the previous part of this lesson"
      
      if continue_studying == "no" 
         return self.option_menu
      elsif continue_studying == "back" 
         return self.bio_43_part_1
      elsif continue_studying == "yes" 
         return self.bio_43_part_3
      end
   end

   def bio_43_part_3
      puts ""
      puts "Coming soon!"
      puts "Looks like you've made it through all the material we have for this subject so far."
      puts "Please stay tuned to see when the material is updated."
      puts ""
      self.option_menu
   end

   def bio_44
      puts ""
      puts "Welcome to Bio 44!"
   end

   def bio_45
      puts ""
      puts "Welcome to Bio 45!"
   end

   def eng_46
      puts ""
      puts "Welcome to English for Beginners."
      puts "Lesson 1: What is a noun?"
      puts ""
      puts "Definition: A noun is a word that names a person, place, thing, or idea."
      puts ""
      puts "Concrete nouns name people, places, or things that you can touch, see, hear, smell, or taste."
      puts "Person: woman, Mr. Rodgers, doctor"
      puts "Place: river, Paris, home"
      puts "Thing: dog, book, Porsche"
      puts ""
      puts "Abstract nouns name ideas, concepts, or emotions. These nouns are intangible, which means you cannot touch, see, hear, smell, or taste them."
      puts "Idea: love, justice, religion"
      puts "Emotion: happiness, anger, excitement"
      puts ""
      puts "Practice What You've Learned"
      puts ""
      puts "Which of the following is a concrete noun?"
      puts "1) man"
      puts "2) running"
      puts "3) fear"
      practice_answer = gets.chomp()
      if practice_answer == "1"
         puts "Awesome!"
      else 
         puts "Sorry, that's incorrect. Let's continue learning about nouns."
      end

   end

   def eng_47
      puts ""
      puts "Welcome to Intermediate English."
      puts "Lesson 1: What is a clause?"
      puts ""
      puts "Definition: A clause is a group of words that has both a subject and a predicate. Every complete sentence is made up of at least one clause."
      puts ""
      puts "Michael bought a new computer. (One sentence, one clause)"
      puts "Michael bought a new computer, but he still has the old one. (One sentence, two clauses)"
      puts "Although he still has his old one, Michael now has a new computer. (One sentence, two clauses)"
      puts ""
      puts "Definition: An independent clause (or main clause) makes sense by itself. It expresses a complete thought."
      puts ""
      puts "Michael bought a new computer. (One independent clause)"
      puts "Michael bought a new computer, but he still has the old one. [Two independent clauses (Coordinating conjunctions don't count as part of the clause.)]"
      puts ""
      puts "Definition: A dependent clause (or subordinate clause) does not make sense by itself. It does not express a complete thought."
      puts ""
      puts "Although he still has his old one. (Without the independent clause, a dependent clause is a sentence fragment.)"
      puts ""
      puts "A dependent clause usually begins with a subordinating conjunction, a relative pronoun, or some other word that causes it to become dependent. A dependent clause will make sense only when attached to an independent clause."
      puts ""
      puts "Michael now has a new computer although he still has his old one. (Combined with an independent clause, the dependent clause makes sense.)"
      puts ""
      puts "Dependent clauses can come after, before, or in the middle of the independent clause."
      puts ""
      puts "Michael, although he still has his old one, now has a new computer. (Dependent clause inside the independent clause.)"
   end

   def eng_48
      puts "eng_48"
      puts ""
      puts "Welcome to Advanced English."
      puts "Lesson 1: What is Inference?"
      puts ""
      puts "Inference is using observation and background to reach a logical conclusion. You probably practive inference everyday. For example, if you see someone eating a new food and he or she makes a face, then you infer he does not like it. Or if someone slams a door, you can infer that he is upset about something."
      puts ""
      puts "Before you can begin to practice inference in literature, you should know what you are looking for. Your goal is to find the intended meaning of the text. Intended meaning is what we think the author is trying to teach us."
      puts ""
      puts "Why is it important to make inferences? When writing a story, an author will not include all the information for us. They will expect us to read between the lines and reach conclusions about the text. When making inferences, you are looking beyond what is stated in the text and finding ideas to which the author only hints. This makes you a more active reader and critical thinker. It also makes it easier to understand what the author is sharing with you."


   end

end

CLI.new()