require 'spec_helper'

describe HumanDetector::Question do

  subject { Factory.build(:question) }

  describe 'activerecord behavior' do
    it 'must use the human_detector_questions table' do
      HumanDetector::Question.table_name.should == 'human_detector_questions'
    end
  end

  describe 'validations' do
    it 'recognizes valid data' do
      subject.should be_valid
    end

    describe 'question' do
      it 'is a required attribute' do
        subject.title = nil
        subject.should_not be_valid
      end
    end # question

    describe 'answer' do
      it 'is a required attribute' do
        subject.answer = nil
        subject.should_not be_valid
      end
    end # answer
  end # validations

end # Question
