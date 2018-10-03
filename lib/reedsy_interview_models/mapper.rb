module ReedsyInterviewModels
  class Mapper

    attr_reader :collections, :adapter

    def initialize(adapter, &blk)
      @collections = {}
      @adapter     = adapter

      instance_eval(&blk) if block_given?

      Model.mapper(self)
    end

    def [](name)
      collection(name.to_sym)&.repository
    end

    def collection(name, &blk)
      if block_given?
        @collections[name] = Mapping::Collection.new(adapter, name, &blk)
      else
        @collections[name] or raise Mapping::UnmappedCollectionError.new(name)
      end
    end

  end
end
