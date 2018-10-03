module ReedsyInterviewModels
  module Repository

    class RecordNotFound < StandardError; end

    def initialize(adapter:, collection:)
      @adapter    = adapter
      @collection = collection
    end

    def create(entity)
      entity.id = @adapter.create(collection: @collection, entity: entity)
    end

    def all
      @adapter.all(@collection)
    end
  end
end
