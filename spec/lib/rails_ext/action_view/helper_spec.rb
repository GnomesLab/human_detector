require 'spec_helper'

describe HumanDetector::ActionView::Helper do

  subject do
    helper = ActionView::Base.new
    helper.controller = ActionController::Base.new

    helper.tap do
      helper.controller.instance_eval do
        def session
          { :session_id => 1 }
        end
      end
    end
  end # Subject

  before(:each) do
    Factory.create(:question)
  end

  describe 'inclusion' do

    it 'is included in ActionView::Base' do
      ActionView::Base.instance_methods.should include :human_detector_tag
    end

  end # inclusion

  describe 'parameters' do

    describe 'defaults' do

      before :each do
        @html = Nokogiri::HTML(subject.human_detector_tag)
      end

      it 'label_class' do
        @html.css('label.human_detector_question').should_not be_empty
      end

      it 'input_class' do
        @html.css('input.human_detector_answer').should_not be_empty
      end

      it 'input_name' do
        @html.css('input[type=text]').attribute('name').value.should == 'human_detector_answer'
      end

      it 'input_text' do
        @html.css('input').inner_text.should == ''
      end

    end # defaults

    describe 'overridables' do

      it 'label_class' do
        @html = Nokogiri::HTML(subject.human_detector_tag :label_css => 'new_class')
        @html.css('label.new_class').should_not be_empty
        @html.css('label.question').should be_empty
      end

      it 'input_class' do
        @html = Nokogiri::HTML(subject.human_detector_tag :input_css => 'new_class')
        @html.css('input.new_class').should_not be_empty
        @html.css('input.answer').should be_empty
      end

      it 'input_name' do
        @html = Nokogiri::HTML(subject.human_detector_tag :input_name => 'new_name')
        @html.css('input[type=text]').attribute('name').value.should == 'new_name'
      end

      it 'input_text' do
        @html = Nokogiri::HTML(subject.human_detector_tag :input_text => 'new_text')
        @html.css('input[type=text]').attribute('value').value.should == 'new_text'
      end

      it 'renderer_class' do
        @html = subject.human_detector_tag :renderer => CustomRenderer
        @html.should == 'custom html'
      end

    end # overridables

  end # parameters

  describe 'hidden field' do

    before :each do
      @html = Nokogiri::HTML(subject.human_detector_tag)
    end

    it 'must have a name' do
      @html.css('input[type=hidden]').attribute('name').value.should == 'human_detector_question_id'
    end

    it 'must have a value' do
      @html.css('input[type=hidden]').attribute('value').value.should_not be_empty
    end

    it 'the value is the encrypted question.id' do
      HumanDetector::Cipher.decrypt(@html.css('input[type=hidden]').attribute('value').value).
        should == "#{HumanDetector::Question.first.id}_#{subject.controller.session[:session_id]}"
    end

  end #hidden_field

end
