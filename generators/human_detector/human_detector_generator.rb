class HumanDetectorGenerator < Rails::Generator::Base
  
  source_root File.expand_path('../templates', __FILE__)

  def manifest
    record do |m|
      m.migration_template 'create_human_detector_questions.rb', 'db/migrate', 
        :migration_file_name => 'create_human_detector_questions'
    end
  end

end