module ReedsyInterviewModels
  module Mapping
    class Collection

      attr_reader :attributes, :name, :adapter

      def initialize(adapter, name, &blk)
        @attributes = {}
        @adapter    = adapter

        instance_eval(&blk) if block_given?
      end

      def entity(klass = nil)
        if klass
          @entity = klass
        else
          @entity
        end
      end

      def repository(klass = nil)
        if klass
          @repository = klass.new(adapter: adapter, collection: self)
        else
          @repository
        end
      end

      def attribute(name, options = {})
        @attributes[name] = options
      end

      def serialize(entity)
        {}.tap do |_attributes|
          _attributes[:id] = entity.id
          @attributes.each do |name, options|
            _attributes[name] = entity.public_send(name)
          end
        end
      end

      def deserialize(records)
        Array(records).map do |record|
          @entity.new(id: record[:id]).tap do |_entity|
            @attributes.each do |_attribute, options|
              _entity.public_send(:"#{_attribute}=", record[_attribute])
            end
          end
        end
      end
    end
  end
end
