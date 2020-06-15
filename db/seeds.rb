Students.destroy_all
Subject.destroy_all
Lessons.destroy_all

josh = Students.create({name: "Josh"})

math_beginner = Subject.create({topic: "Math", level_of_difficulty: "beginner"})

josh_math = Lessons.create({student_id: josh.id, subject_id: math_beginner.id})