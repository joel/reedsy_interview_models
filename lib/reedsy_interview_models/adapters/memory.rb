module ReedsyInterviewModels
  module Adapters
    module Memory
      extend ActiveSupport::Autoload

      eager_autoload do
        autoload :Dataset
        autoload :Command
        autoload :Condition
        autoload :Query
      end
    end
  end
end
