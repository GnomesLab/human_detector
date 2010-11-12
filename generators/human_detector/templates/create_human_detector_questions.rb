class CreateHumanDetectorQuestions < ActiveRecord::Migration
  def self.up
    create_table :human_detector_questions do |t|
      t.string :text
      t.string :answer
    end
  end

  def self.down
    drop_table :human_detector_questions
  end
end