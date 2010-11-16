require 'spec_helper'

describe HumanDetector::FormTagHelper do

  before :all do
    @helper = ActionView::Base.new
    @helper.controller = @controller = ApplicationController.new
    @controller.instance_eval do
      def session
        { :session_id => 1 }
      end
    end
  end

  before :each do
    Factory.create(:question)
    @html = Nokogiri::HTML(@helper.human_detector_tag)
  end

  describe 'inclusion' do
    it 'is included in FormTagHelper' do
      ActionView::Helpers::FormTagHelper.instance_methods.should include :human_detector_tag
    end

  end # inclusion

  describe 'parameters' do
    describe 'defaults' do
      it 'label_class' do
        @html.css('label.question').should_not be_empty
      end

      it 'input_class' do
        @html.css('input.answer').should_not be_empty
      end

      it 'input_name' do
        @html.css('input[type=text]').attribute('name').value.should == 'question_answer'
      end

      it 'input_text' do
        @html.css('input').inner_text.should == ''
      end

    end # defaults

    describe 'overridables' do
      it 'label_class' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :label_css => 'new_class')
        @html.css('label.new_class').should_not be_empty
        @html.css('label.question').should be_empty
      end

      it 'input_class' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :input_css => 'new_class')
        @html.css('input.new_class').should_not be_empty
        @html.css('input.answer').should be_empty
      end

      it 'input_name' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :input_name => 'new_name')
        @html.css('input[type=text]').attribute('name').value.should == 'new_name'
      end

      it 'input_text' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :input_text => 'new_text')
        @html.css('input[type=text]').attribute('value').value.should == 'new_text'
      end

      it 'renderer_class' do
        @html = @helper.human_detector_tag :renderer => CustomRenderer
        @html.should == 'custom html'
      end

    end # overridables
  end # parameters

  describe 'hidden field' do
    it 'must have a name' do
      @html.css('input[type=hidden]').attribute('name').value.should == 'question_id'
    end

    it 'must have a value' do
      @html.css('input[type=hidden]').attribute('value').value.should_not be_empty
    end

    it 'the value is the encrypted question.id' do
      HumanDetector::Cipher.decrypt(@html.css('input[type=hidden]').attribute('value').value).
        should == HumanDetector::Question.first.id.to_s + @controller.session[:session_id].to_s
    end

  end #hidden_field

end
