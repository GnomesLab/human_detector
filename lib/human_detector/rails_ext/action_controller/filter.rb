module HumanDetector

  module ActionController

    module Filter

      def human_detector(options={})
        options.reverse_merge! human_detector_default_options

        before_filter :only => (options[:only].is_a?(Hash) ? options[:only].keys : options[:only]) do
          human_filter(options)
        end
      end # human_detector

      private
        def human_detector_default_options
          @human_detector_default_options ||= { :only => { :create => :new, :update => :edit },
                                                :flash => { :error => 'Invalid captcha answer' },
                                                :input_name => 'question_answer' }
        end

        def human_filter(options)
          human_fail(options) unless params.include?('question_id') && params[options[:input_name]] ==
            Question.find_by_id(HumanDetector::Cipher.decrypt(params['question_id'])).try(:answer)
        end # human_filter

        def human_fail(options)
          return self.send(options[:callback]) if options.has_key?(:callback) && self.respond_to?(options[:callback])

          set_flash_message(options)
          instance_variable_creator(options)
          render extract_render_name(options)
        end # human_fail

        def set_flash_message(options)
          options[:flash] = { :error => options[:flash] } if options[:flash].is_a?(String)
          flash.merge! options[:flash]
        end # set_flash_message

        def instance_variable_creator(options)
          model = options[:model].to_s || self.controller_name.singularize.capitalize
          instance_variable = options[:instance_variable] || "@#{model.downcase}".to_sym
          self.instance_variable_set(instance_variable, model.contantize.new(params[model.downcase.to_sym]))
        end # set_variable

        def extract_render_name(options)
          options[:only].is_a?(Hash) ?
            options[:only][action_name.to_sym] :
            human_detector_default_options[:only][action_name.to_sym] || :index
        end # extract_render_name

    end # Filter

  end # ActionController

end # HumanDetector
