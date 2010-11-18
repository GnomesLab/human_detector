require 'spec_helper'

describe HumanDetector::ActionController::SpamDetected do

  subject { ActionController::Base.new }

  def action_controller(options = {})
    options.reverse_merge!({ :input_name => subject.class::HUMAN_DETECTOR_DEFAULT_OPTIONS[:input_name],
                             :input_value => HumanDetector::Question.first.answer,
                             :hidden_field_id => :human_detector_question_id})

    ActionController::Base.new.tap do |controller|
      controller.instance_eval %Q|
      def params
        { :#{options[:input_name]} => "#{options[:input_value]}",
          :#{options[:hidden_field_id]} => "#{HumanDetector::Question.first.id}_1" }
      end

      def flash
        {}
      end|
    end
  end

  describe 'inclusion' do
    it 'must be available on the ActionController' do
      subject.private_methods.should include :spam_detected?
    end
  end # inclusion

  describe "HUMAN_DETECTOR_DEFAULT_OPTIONS constant" do

    it "contains the default options hash" do
      subject.class::HUMAN_DETECTOR_DEFAULT_OPTIONS.
        should == { :flash => { :error => 'Invalid captcha answer' },
                    :input_name => 'human_detector_answer' }
        end

  end # HUMAN_DETECTOR_DEFAULT_OPTIONS

  describe 'spam_detected?' do

    before :each do
      Factory.create(:question)
    end

    describe 'behavior' do
      it "returns true for a valid answer" do
        action_controller.send(:spam_detected?).should be_true
      end

      it "returns false for a invalid answer" do
        action_controller(:input_value => 'dummy anwser').send(:spam_detected?).should be_false
      end

      it "returns false if there is no answer field" do
        action_controller(:input_name => 'dummy_name').send(:spam_detected?).should be_false
      end

      it "returns false if there is no hidden field" do
        action_controller(:hidden_field_id => 'dummy_id').send(:spam_detected?).should be_false
      end

    end

    describe 'options' do

      it 'supports an optional hash parameter' do
        subject.method(:spam_detected?).arity.should == -1
      end

      it "uses human_detector_answer as the default input name" do
        action_controller(subject.class::HUMAN_DETECTOR_DEFAULT_OPTIONS[:input_name]).send(:spam_detected?).
          should be_true
      end

      it "allows the override of the input name" do
        action_controller(:input_name => 'my_input_name').send(:spam_detected?, :input_name => 'my_input_name')
          .should be_true
      end

      it "has a default flash error" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?)
        controller.flash.should == subject.class::HUMAN_DETECTOR_DEFAULT_OPTIONS[:flash]

      end

      it "allows the override of the flash error with a string" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?, :flash => 'my custom error')
        controller.flash.should == { :error => 'my custom error' }
      end

      it "allows the override of the flash error with a hash" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?, :flash => { :alert => 'my error'} )
        controller.flash.should == { :alert => 'my error'}
      end

    end # options

  end # human_detector

end # HumanDetector::ActionControllerHelper
