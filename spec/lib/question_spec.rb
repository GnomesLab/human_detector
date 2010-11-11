require 'spec_helper'

describe Question do

  subject { Factory.build(:question) }

    describe 'validations' do
      it 'recognizes valid data' do
        pending
        subject.should be_valid
      end
      
      describe 'question' do
        it 'defines question as a required attribute' do
          pending
          subject.question = nil
          subject.should_not be_valid
        end
        
        it 'doesnt support too small questions' do
          pending
          subject.question = "i"
          subject.should_not be_valid
        end
        
        it 'doesnt support too large questions' do
          pending
          subject.question = ActiveSupport::SecureRandom.hex(31)
          subject.should_not be_valid
        end
      end # question
      
      describe 'answer' do
        it 'defines answer as a required attribute' do
          pending
          subject.answer = nil
          subject.should_not be_valid
        end
      end # answer
    end # validations



end # Question
    
    