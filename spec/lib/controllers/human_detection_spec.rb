require 'spec_helper'

describe HumanDetector::HumanDetection do

  before :all do
    @action_controller = ActionController::Base.new
  end

  describe 'inclusion' do
    it 'is included on the ActionController' do
      @action_controller.should respond_to :human_detection
    end
  end # inclusion

  describe 'human_detection' do
    describe 'options' do
      it 'accepts only array' do
        pending
      end
      
      it 'accepts except array' do
        pending
      end
      
      it 'accepts flash message' do
        pending
      end
      
      it 'accepts an error callback' do
        pending
      end
    end # options
  end # human_detection
end # HumanDetector::HumanDetection
