module ReedsyInterviewModels
  module Adapters
    module Memory
      extend ActiveSupport::Autoload

      eager_autoload do
        autoload :Dataset
        autoload :Command
        autoload :Condition
      end
    end
  end
end
