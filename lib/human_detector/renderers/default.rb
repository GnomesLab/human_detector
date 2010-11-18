module HumanDetector

  module Renderers

    class Default

      def self.render(view, id, title, options = {})
        options.reverse_merge!({ :label_css => 'human_detector_question',
                                 :input_css => 'human_detector_answer',
                                 :input_name => 'human_detector_answer',
                                 :label_prefix => '',
                                 :label_sufix => '',
                                 :input_text => '' })

        output = view.label_tag(options[:input_name],
                                (options[:label_prefix].html_safe << title << options[:label_sufix].html_safe),
                                :class => options[:label_css])
        output << view.text_field_tag(options[:input_name], options[:input_text], :class => options[:input_css])
        output.tap { |s| s << view.hidden_field_tag('human_detector_question_id', id) }
      end # render

    end # Default

  end # Renderers

end # HumanDetector
