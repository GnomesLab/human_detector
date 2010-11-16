module HumanDetector

  module ActionControllerHelper

    def human_detection(options={})
      before_filter :only => options[:only], :except => options[:except] do
        human_filter(options.except(:only, :except))
      end
    end

    private
      def human_filter(options)
        options.reverse_merge! :input_name => 'question_answer', :flash_error => 'Invalid captcha'

        if params.include?('question_id') && params.include?(options[:input_name])
          unless params[options[:input_name]] == Question.find_by_id(params['question_id']).try(:answer)
            if options.has_key?(:callback) && self.responds_to?(options[:callback])
              self.send(options[:callback])
            else
              if options.include?(:instance_variable) && options.include?(:model)
                self.instance_variable_set(options[:instance_variable], options[:model])
              else
                self.instance_variable_set("@#{self.controller_name.singularize}".to_sym, self.controller_name.singularize.capitalize.constantize.new(params[self.controller_name.singularize.to_sym]))
              end
              flash[:error] = options[:flash_error]
              case request.parameters[:action]
              when 'create'
                render :new
              when 'update'
                render :edit
              end
            end
          end
        end

      end

  end # ActionControllerHelper

end # HumanDetector
