module HumanDetector

  module FormTagHelper

    def human_detector_tag(options = {})
      options.reverse_merge! :renderer => HumanDetector::DefaultRenderer
      question = Question.random
      options[:renderer].send(:render, question.title,
                              Cipher.encrypt(question.id.to_s << controller.session[:session_id].to_s),
                              self, options.except(:renderer))
    end # human_detector_tag

  end # FormTagHelper

end # HumanDetector
