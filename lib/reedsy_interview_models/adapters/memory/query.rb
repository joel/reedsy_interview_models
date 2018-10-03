module ReedsyInterviewModels
  module Adapters
    module Memory
      class Query

        attr_reader :conditions

        def initialize(dataset, &block)
          @dataset    = dataset
          @conditions = []

          instance_eval(&block) if block_given?
        end

        def where(conditions = {})
          @conditions += conditions.map { |operator_and_field, value| Condition.new(operator_and_field, value) }
          self
        end

        def +(query)
          @conditions += query.conditions
          self
        end

        def all
          filtered
        end

        def filtered
          @dataset.all.dup.find_all do |entry|
            accepted = true

            @conditions.each do |_condition|
              unless _condition.matches?(entry)
                accepted = false
                break # no to go further
              end
            end
            accepted
          end
        end

      end
    end
  end
end
