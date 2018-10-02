module ReedsyInterviewModels
  module Adapters
    module Memory
      extend ActiveSupport::Autoload

      eager_autoload do
        autoload :Dataset
      end
    end
  end
end
