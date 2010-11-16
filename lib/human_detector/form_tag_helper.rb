module HumanDetector

  module FormTagHelper

    def human_detector_tag(options = {})
      options.reverse_merge! :renderer_class => HumanDetector::RendererBase,
        :model_class => HumanDetector::Question,
        :model_method => :random

      question = options[:model_class].send(options[:model_method])
      options[:renderer_class].send(:render, question, self, options.except(:renderer_class, :model_class, :model_method))

    end # human_detector_tag

  end # FormTagHelper

end # HumanDetector
