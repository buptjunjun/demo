class Question1 < ActiveRecord::Base
  has_many :question1_answer1ships
  has_many :answer1s, :through => :question1_answer1ships

  def self.searchAnswersByText1(q)
      answer1s = search('text1',q)
  end
  def self.searchAnswersByImage(q)
     answer1s = Answer1.where([field+" like ?","%#{q}%"]).limit(20)
  end

  def self.search(field,q)
      answer1s = Answer1.where([field+" like ?","%#{q}%"]).limit(20)
  end

end
