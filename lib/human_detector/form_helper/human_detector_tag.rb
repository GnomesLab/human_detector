module HumanDetector
  module FormTagHelper
    def human_detector_tag(options = {})
      options.reverse_merge! :label_css => 'question',
                             :input_css => 'answer',
                             :input_text => ''
                             
      output = label_tag('aqui vai estar a pergunta', nil, :class => options[:label_css])
      output << text_field_tag(options[:input_text], nil, :class => options[:input_css])
      output.tap { |s| s << hidden_field_tag('question_id', 'encrypted_key_will_go_here', :class => 'hidden_field') }
    end # draw_human_detector
  end # FormHelper
end # HumanDetector
