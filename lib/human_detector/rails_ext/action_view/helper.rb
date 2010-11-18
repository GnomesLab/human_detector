module HumanDetector

  module ActionView

    module Helper

      def human_detector_tag(options = {})
        options.reverse_merge! :renderer => HumanDetector::Renderers::Default

        options[:renderer].send(:render,
                                self,
                                Cipher.encrypt("#{(question = Question.random).id}_#{controller.session[:session_id]}"),
                                question.title,
                                options.except(:renderer))
      end # human_detector_tag

    end # Helper

  end # ActionView

end # HumanDetector
