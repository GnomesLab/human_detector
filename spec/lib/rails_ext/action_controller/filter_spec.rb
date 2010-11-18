require 'spec_helper'

describe HumanDetector::ActionController::Filter do

  subject { ActionController::Base }

  describe 'inclusion' do
    it 'must be available on the ActionController' do
      subject.should respond_to :human_detector
    end
  end # inclusion

  describe "human_detector_default_options" do

    before(:each) do
      @action_controller = subject
    end

    it "returns the default options hash" do
      @action_controller.send(:human_detector_default_options).
        should == { :only => { :create => :new, :update => :edit },
                    :flash => { :error => 'Invalid captcha answer' },
                    :input_name => 'question_answer' }
    end

    it "uses memoization" do
      @action_controller.send(:human_detector_default_options).object_id.
        should == @action_controller.send(:human_detector_default_options).object_id
    end

  end # default_human_detector_options

  describe 'human_detector' do

    describe 'options' do

      it 'accepts an array with the actions to protect' do
        subject.class_eval { human_detector :only => [:new] }
        subject._process_action_callbacks.select { |c| c.kind == :before && c.options[:only] == [:new] }
        .should_not be_empty
      end

    end # options

  end # human_detector

end # HumanDetector::ActionControllerHelper
