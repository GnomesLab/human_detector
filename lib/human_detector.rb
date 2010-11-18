require 'action_view'         unless defined? ActionView::Base
require 'action_controller'   unless defined? ActionController::Base
require 'active_record'       unless defined? ActiveRecord::Base
require 'activerecord_random'

module HumanDetector

  autoload :ActionView,             'human_detector/rails_ext/action_view'
  autoload :ActionController,       'human_detector/rails_ext/action_controller'
  autoload :Renderers,              'human_detector/renderers'
  autoload :Question,               'human_detector/question'
  autoload :Cipher,                 'human_detector/cipher'

end # HumanDetector

# Rails extentions
ActionView::Base.send :include, HumanDetector::ActionView::Helper
ActionController::Base.send :include, HumanDetector::ActionController::SpamDetected