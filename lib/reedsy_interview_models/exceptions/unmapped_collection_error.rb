module ReedsyInterviewModels
  module Exceptions
    class UnmappedCollectionError < ::StandardError
      def initialize(name)
        super("Cannot find collection: #{ name }")
      end
    end
  end
end
