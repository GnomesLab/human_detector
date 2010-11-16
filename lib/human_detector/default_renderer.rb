module HumanDetector

  class DefaultRenderer

    def self.render(title, encrypted_id, view_helper, options = {})
      options.reverse_merge! :label_css => 'question',
        :input_css => 'answer',
        :input_name => 'question_answer',
        :input_text => ''

      output = view_helper.label_tag(nil, title, :class => options[:label_css])
      output << view_helper.text_field_tag(options[:input_name], options[:input_text], :class => options[:input_css])
      output.tap { |s| s << view_helper.hidden_field_tag('question_id', encrypted_id) }

    end # render

  end # RendererBase

end # HumanDetector
