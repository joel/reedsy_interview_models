module ReedsyInterviewModels
  module Mapping
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Collection
    end

    class UnmappedCollectionError < ::StandardError
      def initialize(name)
        super("Cannot find collection: #{ name }")
      end
    end
  end
end
