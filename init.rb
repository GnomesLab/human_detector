require 'action_view'
require 'action_controller'
require 'active_record'
require 'human_detector'
require 'activerecord_random'

ActionView::Helpers::FormTagHelper.send :include, HumanDetector::FormTagHelper
ActionController::Base.send :extend, HumanDetector::ActionControllerHelper
