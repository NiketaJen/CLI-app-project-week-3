Students.destroy_all
Subjects.destroy_all
Lessons.destroy_all

#Students #########################################################################
josh = Students.create({name: "Josh"})
miriam = Students.create({name: "Miriam"})
brie = Students.create({name: "Brie"})

#Subjects #########################################################################
math_beginner = Subjects.create({topic: "Math", level_of_difficulty: "beginner"})
math_intermediate = Subjects.create({topic: "Math", level_of_difficulty: "intermediate"})
math_expert = Subjects.create({topic: "Math", level_of_difficulty: "expert"})
biology_beginner = Subjects.create({topic: "Biology", level_of_difficulty: "beginner"})
biology_intermediate = Subjects.create({topic: "Biology", level_of_difficulty: "intermediate"})
biology_expert = Subjects.create({topic: "Biology", level_of_difficulty: "expert"})
english_beginner = Subjects.create({topic: "English", level_of_difficulty: "beginner"})
english_intermediate = Subjects.create({topic: "English", level_of_difficulty: "intermediate"})
english_expert = Subjects.create({topic: "English", level_of_difficulty: "expert"})
coding_beginner = Subjects.create({topic: "Coding", level_of_difficulty: "beginner"})
coding_intermediate = Subjects.create({topic: "Coding", level_of_difficulty: "intermediate"})
coding_expert = Subjects.create({topic: "Coding", level_of_difficulty: "expert"})

#Lessons ###########################################################################
 j_math_b = Lessons.create({student_id: josh.id, subject_id: math_beginner.id})
 j_math_i = Lessons.create({student_id: josh.id, subject_id: math_intermediate.id})
j_math_e = Lessons.create({student_id: josh.id, subject_id: math_expert.id})
m_math_b = Lessons.create({student_id: miriam.id, subject_id: math_beginner.id})
m_math_i = Lessons.create({student_id: miriam.id, subject_id: math_intermediate.id})
m_math_e = Lessons.create({student_id: miriam.id, subject_id: math_expert.id})
b_math_b = Lessons.create({student_id: brie.id, subject_id: math_beginner.id})
b_math_i = Lessons.create({student_id: brie.id, subject_id: math_intermediate.id})
b_math_e = Lessons.create({student_id: brie.id, subject_id: math_expert.id})

j_biology_b = Lessons.create({student_id: josh.id, subject_id: biology_beginner.id})
j_biology_i = Lessons.create({student_id: josh.id, subject_id: biology_intermediate.id})
j_biology_e = Lessons.create({student_id: josh.id, subject_id: biology_expert.id})
m_biology_b = Lessons.create({student_id: miriam.id, subject_id: biology_beginner.id})
m_biology_i = Lessons.create({student_id: miriam.id, subject_id: biology_intermediate.id})
m_biology_e = Lessons.create({student_id: miriam.id, subject_id: biology_expert.id})
b_biology_b = Lessons.create({student_id: brie.id, subject_id: biology_beginner.id})
b_biology_i = Lessons.create({student_id: brie.id, subject_id: biology_intermediate.id})
b_biology_e = Lessons.create({student_id: brie.id, subject_id: biology_expert.id})

j_english_b = Lessons.create({student_id: josh.id, subject_id: english_beginner.id})
j_english_i = Lessons.create({student_id: josh.id, subject_id: english_intermediate.id})
j_english_e = Lessons.create({student_id: josh.id, subject_id: english_expert.id})
m_english_b = Lessons.create({student_id: miriam.id, subject_id: english_beginner.id})
m_english_i = Lessons.create({student_id: miriam.id, subject_id: english_intermediate.id})
m_english_e = Lessons.create({student_id: miriam.id, subject_id: english_expert.id})
b_english_b = Lessons.create({student_id: brie.id, subject_id: english_beginner.id})
b_english_i = Lessons.create({student_id: brie.id, subject_id: english_intermediate.id})
b_english_e = Lessons.create({student_id: brie.id, subject_id: english_expert.id})

j_coding_b = Lessons.create({student_id: josh.id, subject_id: coding_beginner.id})
j_coding_i = Lessons.create({student_id: josh.id, subject_id: coding_intermediate.id})
j_coding_e = Lessons.create({student_id: josh.id, subject_id: coding_expert.id})
m_coding_b = Lessons.create({student_id: miriam.id, subject_id: coding_beginner.id})
m_coding_i = Lessons.create({student_id: miriam.id, subject_id: coding_intermediate.id})
m_coding_e = Lessons.create({student_id: miriam.id, subject_id: coding_expert.id})
b_coding_b = Lessons.create({student_id: brie.id, subject_id: coding_beginner.id})
b_coding_i = Lessons.create({student_id: brie.id, subject_id: coding_intermediate.id})
b_coding_e = Lessons.create({student_id: brie.id, subject_id: coding_expert.id})