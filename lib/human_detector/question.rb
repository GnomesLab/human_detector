class Question < ActiveRecord::Base
  atrr_acessible :question, :answer
  
  validates :question, :presence => true, :length => { :within => 3..30 }
  validates :answer, :presence => true
  
end