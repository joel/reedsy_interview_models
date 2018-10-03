module ReedsyInterviewModels
  module Adapters
    module Memory
      class Adapter

        def initialize
          @dataset = Dataset.new
        end

        def all(collection)
          collection.deserialize(dataset.all)
        end

        def create(collection:, entity:)
          Memory::Command.new(dataset: dataset, collection: collection).create(entity)
        end

        private

        attr_reader :dataset

      end
    end
  end
end
