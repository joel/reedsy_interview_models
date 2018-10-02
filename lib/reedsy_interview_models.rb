require "reedsy_interview_models/version"
require "active_support/dependencies/autoload"

module ReedsyInterviewModels
  extend ActiveSupport::Autoload

  autoload :Entity
  autoload :Adapters
end
