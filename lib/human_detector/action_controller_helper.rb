module HumanDetector

  module ActionControllerHelper

    def human_detection(options={})
      before_filter :only => options[:only], :except => options[:except] do
        human_filter(options.except(:only, :except))
      end
    end

    private
      def human_filter(options)
        options.reverse_merge! :input_name => 'question_answer'
        
        if params.include?('question_id') && params.include?(options[:input_name])
          unless params[options[:input_name]] == Question.find_by_id(params['question_id']).try(:answer)
            options[:callback]
          end
        end
      end

  end # ActionControllerHelper

end # HumanDetector
