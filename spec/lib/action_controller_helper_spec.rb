require 'spec_helper'

describe HumanDetector::ActionControllerHelper do

  describe 'inclusion' do
    it 'must be available on the ActionController' do
      ActionController::Base.should respond_to :human_detection
    end
  end # inclusion

  describe 'human_detection' do

    describe 'options' do

      it 'accepts an array with the actions to protect' do
        ApplicationController.class_eval { human_detection :only => [:new] }
        ApplicationController._process_action_callbacks.select { |c| c.kind == :before && c.options[:only] == [:new] }
          .should_not be_empty
      end

      it 'accepts an array with the actions to not protect' do
        ApplicationController.class_eval { human_detection :except => [:new] }
        ApplicationController._process_action_callbacks.select { |c| c.kind == :before && c.options[:except] == [:new] }
          .should_not be_empty
      end

    end # options

  end # human_detection

end # HumanDetector::HumanDetection
