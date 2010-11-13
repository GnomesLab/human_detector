module HumanDetector

  module ActionControllerHelper

    def human_detection(options={})
      before_filter :only => options[:only], :except => options[:except] do
        human_filter(options.except(:only, :except))
      end
    end

    private
      def human_filter(options)
      end

  end # ActionControllerHelper

end # HumanDetector