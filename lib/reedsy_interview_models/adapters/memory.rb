module ReedsyInterviewModels
  module Adapters
    module Memory
      extend ActiveSupport::Autoload

      eager_autoload do
        autoload :Dataset
        autoload :Command
        autoload :Condition
        autoload :Query
        autoload :Adapter
      end
    end
  end
end
