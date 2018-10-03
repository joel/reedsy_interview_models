module ReedsyInterviewModels
  module Adapters
    module Memory
      class Dataset
        class PrimaryKey
          def initialize
            @current = 0
          end

          def increment!
            yield(@current += 1)
            @current
          end
        end

        attr_reader :records, :name

        def initialize
          @records     = {}
          @primary_key = PrimaryKey.new
        end

        def insert(record)
          @primary_key.increment! do |id|
            record[:id] = id
            records[id] = record
          end
        end

        def find(id)
          records.fetch(id) do
            raise Exceptions::RecordNotFound, "could not find #{name} with #{identity} = #{id}"
          end
        end

        def all
          records.values
        end

        def size
          records.size
        end
      end
    end
  end
end
