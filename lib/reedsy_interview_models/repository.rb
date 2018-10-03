module ReedsyInterviewModels
  module Repository

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

    def find(id)
      @adapter.find(collection: @collection, id: id)
    end
  end
end
