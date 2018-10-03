module ReedsyInterviewModels
  module Adapters
    module Memory
      class Adapter

        def initialize
          @datasets = Hash.new { |hash, name| hash[name] = Dataset.new }
        end

        def all(collection)
          collection.deserialize(dataset(collection).all)
        end

        def find(collection:, id:)
          record = dataset(collection).find(id)
          collection.deserialize([record]).first
        end

        def create(collection:, entity:)
          Memory::Command.new(dataset: dataset(collection), collection: collection).create(entity)
        end

        private

        def dataset(collection)
          @datasets[collection]
        end

      end
    end
  end
end
