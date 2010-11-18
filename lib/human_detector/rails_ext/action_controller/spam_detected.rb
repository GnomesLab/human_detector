module HumanDetector

  module ActionController

    module SpamDetected

      HUMAN_DETECTOR_DEFAULT_OPTIONS = { :flash => { :error => 'Invalid captcha answer' },
                                         :input_name => 'human_detector_answer' }

      private
        def human_detected?(options = {})
          !spam_detected?(options)
        end

        def spam_detected?(options = {})
          options.reverse_merge! HUMAN_DETECTOR_DEFAULT_OPTIONS

          return false if params.include?('human_detector_question_id') && params[options[:input_name]] ==
            Question.find_by_id(HumanDetector::Cipher.decrypt(params['human_detector_question_id']).
                                gsub(/(_\S+)/, '')).try(:answer)

          options[:flash] = { :error => options[:flash] } if options[:flash].is_a?(String)
          flash.merge! options[:flash]

          return true
        end

    end # Filter

  end # ActionController

end # HumanDetector
