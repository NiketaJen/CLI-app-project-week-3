
class Student < ActiveRecord::Base
    has_many(:lessons)
    has_many(:subjects, through: :lessons)
end