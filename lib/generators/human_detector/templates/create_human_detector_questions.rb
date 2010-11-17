require 'human_detector'

class CreateHumanDetectorQuestions < ActiveRecord::Migration
  def self.up
    create_table :human_detector_questions, :force => true do |t|
      t.string :title, :null => false
      t.string :answer, :null => false
      t.timestamps
    end

    50.times { |i| HumanDetector::Question.create(:title => "How much is #{i} + #{i * 2}?", :answer => "#{i + i * 2}") }
  end

  def self.down
    drop_table :human_detector_questions
  end
end