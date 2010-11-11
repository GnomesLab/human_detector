require 'spec_helper'

describe HumanDetector::FormTagHelper do

  before :all do
    @helper = ActionView::Base.new
  end

  describe 'behaviour' do
    it 'is included in FormTagHelper' do
      ActionView::Helpers::FormTagHelper.instance_methods.should include :human_detector_tag
    end

  end # behaviour

  describe 'parameters' do
    describe 'defaults' do
      before :all do
        @html = Nokogiri::HTML(@helper.human_detector_tag)
      end

      it 'label_class' do
        @html.css('label.question').should_not be_empty
      end

      it 'span_class' do
        @html.css('span.captcha').should_not be_empty
      end

      it 'input_class' do
        @html.css('input.answer').should_not be_empty
      end

      it 'label_text' do
        @html.css('span').inner_text.should == 'Please answer the following logic question:'
      end

      it 'input_text' do
        @html.css('input').inner_text.should == ''
      end
    end # defaults

    describe 'overridables' do
      it 'label_class' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :label_class => 'new_class')
        @html.css('label.new_class').should_not be_empty
        @html.css('label.question').should be_empty
      end

      it 'input_class' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :input_class => 'new_class')
        @html.css('input.new_class').should_not be_empty
        @html.css('input.answer').should be_empty
      end

      it 'span_class' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :span_class => 'new_class')
        @html.css('span.new_class').should_not be_empty
        @html.css('span.captcha').should be_empty
      end

      it 'span_text' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :span_text => 'new_text')
        @html.css('span').inner_text.should == 'new_text'
        @html.css('span').inner_text.should_not == 'Please answer the following logic question:'
      end

      it 'input_text' do
        @html = Nokogiri::HTML(@helper.human_detector_tag :input_text => 'new_text')
        @html.css('input[type=text]').attribute('name').value.should == 'new_text'
        @html.css('input[type=text]').attribute('name').value.should_not == ''
      end
    end # overridables
  end # parameters

  describe 'hidden field' do
    it 'must have a name' do
      @html = Nokogiri::HTML(@helper.human_detector_tag)
      @html.css('input[type=hidden]').attribute('name').value.should == 'question_id'
    end

    it 'must have a value' do
      @html = Nokogiri::HTML(@helper.human_detector_tag)
      @html.css('input[type=hidden]').attribute('value').value.should_not be_empty
    end

  end #hidden_field

end
