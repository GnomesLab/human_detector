module HumanDetector

  autoload :ActionView,             'human_detector/rails_ext/action_view'
  autoload :ActionController,       'human_detector/rails_ext/action_controller'
  autoload :DefaultRenderer,        'human_detector/default_renderer'
  autoload :Question,               'human_detector/question'
  autoload :Cipher,                 'human_detector/cipher'

end # HumanDetector

# Rails extentions
ActionView::Base.send :include, HumanDetector::ActionView::Helper
ActionController::Base.send :include, HumanDetector::ActionController::Filter