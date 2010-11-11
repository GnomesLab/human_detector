module HumanDetector
  module FormTagHelper
    def human_detector_tag(options = {})
      options.reverse_merge! :span_class => 'captcha',
                             :span_text => 'Please answer the following logic question:',
                             :label_class => 'question',
                             :input_class => 'answer',
                             :input_text => ''
      content_tag(:span, options[:span_text], :class => options[:span_class]) +
      content_tag(:br) +
      label_tag('aqui vai estar a pergunta', nil, :class => options[:label_class]) +
      text_field_tag(options[:input_text], nil, :class => options[:input_class]) +
      hidden_field_tag('question_id', 'encrypted_key_will_go_here', :class => 'hidden_field')
    end # draw_human_detector
  end # FormHelper
end # HumanDetector
