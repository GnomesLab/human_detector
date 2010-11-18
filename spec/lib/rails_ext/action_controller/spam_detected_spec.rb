require 'spec_helper'

describe HumanDetector::ActionController::SpamDetected do

  subject { ActionController::Base.new }

  def action_controller(options = {})
    options.reverse_merge!({ :input_name => subject.class::HUMAN_DETECTOR_DEFAULT_OPTIONS[:input_name],
                             :input_value => HumanDetector::Question.first.answer,
                             :hidden_field_id => 'human_detector_question_id'})

    ActionController::Base.new.tap do |controller|
      controller.stub!(:params).
        and_return({ options[:input_name] => options[:input_value],
                     options[:hidden_field_id] =>
                     HumanDetector::Cipher.encrypt("#{HumanDetector::Question.first.id}_1") })

        controller.stub!(:flash).and_return({})
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
      it "returns false for a valid answer" do
        action_controller.send(:spam_detected?).should be_false
      end

      it "returns true for a invalid answer" do
        action_controller(:input_value => 'dummy answer').send(:spam_detected?).should be_true
      end

      it "returns true if there is no answer field" do
        action_controller(:input_name => 'dummy_name').send(:spam_detected?).should be_true
      end

      it "returns true if there is no hidden field" do
        action_controller(:hidden_field_id => 'dummy_id').send(:spam_detected?).should be_true
      end

    end

    describe 'options' do

      it 'supports an optional hash parameter' do
        subject.method(:spam_detected?).arity.should == -1
      end

      it "uses human_detector_answer as the default input name" do
        action_controller(:input_name => 'human_detector_answer').send(:spam_detected?).should be_false
      end

      it "allows the override of the input name" do
        action_controller(:input_name => 'my_input_name').send(:spam_detected?, :input_name => 'my_input_name')
          .should be_false
      end

      it "has a default flash error" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?).should be_true
        controller.flash.should == { :error => 'Invalid captcha answer' }

      end

      it "allows the override of the flash error with a string" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?, :flash => 'my custom error').should be_true
        controller.flash.should == { :error => 'my custom error' }
      end

      it "allows the override of the flash error with a hash" do
        controller = action_controller(:input_value => 'dummy answer')
        controller.send(:spam_detected?, :flash => { :alert => 'my error'} ).should be_true
        controller.flash.should == { :alert => 'my error'}
      end

    end # options

  end # spam_detected?

  describe 'human_detected?' do

    before :each do
      Factory.create(:question)
    end

    it "invokes spam detected with received options" do
      (controller = action_controller).should_receive(:spam_detected?).with({})
      controller.send(:human_detected?)
    end
  end # human_detected?

end # HumanDetector::ActionControllerHelper
