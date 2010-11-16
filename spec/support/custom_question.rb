class CustomQuestion
  attr_accessor :title, :answer, :id
  
  def initialize(id, title, answer ='')
    self.id = id
    self.title = title
    self.answer = answer
  end
  
  def self.random
    CustomQuestion.new 1, 'Get a random question'
  end
end