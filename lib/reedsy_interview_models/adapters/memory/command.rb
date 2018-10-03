module ReedsyInterviewModels
  module Adapters
    module Memory
      class Command

        def initialize(dataset:, collection:)
          @dataset, @collection = dataset, collection
        end

        def create(entity)
          @dataset.insert(serialize(entity))
        end

        private

        def serialize(entity)
          @collection.serialize(entity)
        end
      end
    end
  end
end
