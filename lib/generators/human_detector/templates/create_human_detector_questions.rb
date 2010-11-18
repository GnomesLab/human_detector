require 'human_detector'

class CreateHumanDetectorQuestions < ActiveRecord::Migration
  def self.up
    create_table :human_detector_questions, :force => true do |t|
      t.string :title, :null => false
      t.string :answer, :null => false
      t.timestamps
    end

    5.times { |i| HumanDetector::Question.create(:title => "How much is #{i} + #{i * 2}?", :answer => "#{i + i * 2}") }
    5.times { |i| HumanDetector::Question.create(:title => "Complete the sequence: #{i}, #{i+1}, #{i+2}, __ ?",
                                                 :answer => "#{i+3}") }
    5.times { |i| HumanDetector::Question.create(:title => "Complete the sequence: #{i}, __, #{i+2}, #{i+3} ?",
                                                 :answer => "#{i+1}") }
    { 0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten" }.each { |k,v| HumanDetector::Question.create(:title=> "#{k} in English (e.g. #{v})?", :answer=> v) }

    10.times do |i|
      HumanDetector::Question.create(:title => "Which year was in 2010 minus #{i + 1} (e.g. #{2010 - (i + 1)})?",
                                     :answer => (2010 - (i + 1)).to_s)
    end

    100.times do |i|
      HumanDetector::Question.create(:title => "Is #{i} and even number (e.g. #{i.even? ? 'yes' : 'no'})?",
                                     :answer => i.even? ? "yes" : "no")
      HumanDetector::Question.create(:title => "Is #{i} an odd number (e.g. #{i.even? ? 'no' : 'yes'})?",
                                     :answer => i.even? ? 'no' : 'yes')
    end

    HumanDetector::Question.create(:title => 'Are you a bot (e.g. yes)?', :answer => 'no')
    HumanDetector::Question.create(:title => 'Are you a sure? (e.g. no)?', :answer => 'yes')
    HumanDetector::Question.create(:title => 'Are you alive? (e.g. no)?', :answer => 'yes')
    HumanDetector::Question.create(:title => 'Are you human? (e.g. no)?', :answer => 'yes')
    HumanDetector::Question.create(:title => 'Do you live on earth (e.g. yes)?', :answer => 'yes')
    HumanDetector::Question.create(:title => 'Are you spamming (e.g. no)?', :answer => 'no')
    HumanDetector::Question.create(:title => 'Are you a spam bot (e.g. yes)?', :answer => 'no')
  end

  def self.down
    drop_table :human_detector_questions
  end
end
