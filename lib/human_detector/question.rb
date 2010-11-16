module HumanDetector

  # TODO: Add docs
  class Question < ActiveRecord::Base
    set_table_name 'human_detector_questions'

    validates :title, :presence => true
    validates :answer, :presence => true
  end # Question

end # HumanDetector
