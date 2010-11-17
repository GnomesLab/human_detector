require 'rails/generators/active_record'

module HumanDetector

  module Generators

    class HumanDetectorGenerator < ActiveRecord::Generators::Base
      desc "Generates the migration required to support HumanDetector Ruby Gem."

      namespace "human_detector"

      source_root File.expand_path('../templates', __FILE__)

      def generate_migration
        migration_template 'create_human_detector_questions.rb', 'db/migrate/create_human_detector_questions.rb'
      end # generate_human_detector

    end # HumanDetectorGenerator

  end # Generators

end # HumanDetector
