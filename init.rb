require 'action_view'
require 'human_detector'

autoload :Question, 'human_detector/question'

ActionView::Helpers::FormTagHelper.send :include, HumanDetector::FormTagHelper
