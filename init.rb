require 'action_view'
require 'human_detector'

ActionView::Helpers::FormTagHelper.send :include, HumanDetector::FormTagHelper
