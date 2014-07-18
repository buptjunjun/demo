class Answer1 < ActiveRecord::Base
  has_many :question1_answer1ships
  has_many :question1s, :through => :question1_answer1ships
end
