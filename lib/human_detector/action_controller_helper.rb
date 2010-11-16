module HumanDetector

  module ActionControllerHelper

    # recebe do controller :only, :instance_variable, :flash => 'a' flash => {:error => 'x'}, :model, :callback

    def human_detection(options={})
      before_filter :only => (options[:only].is_a?(Hash) ? options[:only].keys : options[:only]) do
        human_filter(options)
      end
    end # human_detection

    private
      def human_filter(options)
        options.reverse_merge! :input_name => 'question_answer'

        human_fail(options) unless params.include?('question_id') && params[options[:input_name]] ==
          Question.find_by_id(HumanDetector::Cipher.decrypt(params['question_id'])).try(:answer)

      end # human_filter

      def human_fail(options)
        options.reverse_merge! :flash => { :error => 'Invalid captcha' }
        return self.send(options[:callback]) if options.has_key?(:callback) && self.responds_to?(options[:callback])

        options[:flash] = { :error => options[:flash] } if options[:flash].is_a?(String)
        flash.merge! options[:flash]

        model = options[:model] || self.controller_name.singularize.capitalize
        instance_variable = options[:instance_variable] || "@#{model.downcase}".to_sym
        
        
        
        
        

      end # ActionControllerHelper

  end # HumanDetector
  
  
  # if options.include?(:instance_variable) && options.include?(:model)
  #   self.instance_variable_set(options[:instance_variable], const_get(options[:model].to_s).new)
  # else
  #   self.instance_variable_set("@#{self.controller_name.singularize}".to_sym, self.controller_name.singularize.capitalize.constantize.new(params[self.controller_name.singularize.to_sym]))
  # end
