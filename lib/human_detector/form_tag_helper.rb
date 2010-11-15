module HumanDetector

  module FormTagHelper

    def human_detector_tag(options = {})
      options.reverse_merge! :label_css => 'question',
        :input_css => 'answer',
        :input_name => 'question_answer',
        :input_text => ''

      question = Question.random

      output = label_tag(nil, question.title, :class => options[:label_css])
      output << text_field_tag(options[:input_name], options[:input_text], :class => options[:input_css])
      output.tap { |s| s << hidden_field_tag('question_id', question.id) }
    end # human_detector_tag

  end # FormTagHelper

end # HumanDetector
