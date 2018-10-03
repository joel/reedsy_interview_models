module ReedsyInterviewModels
  module Adapters
    module Memory
      class Condition

        class UnsupportedOperator < StandardError; end

        def initialize(operator_and_field, value)
          @operator_and_field, @value = operator_and_field, value
          @operator, @field = :==, nil

          decode_operator_and_field!
        end

        def matches?(entry)
          entry_value = entry[@field]

          case @operator
          when :== then entry_value == @value
          when :eq then entry_value == @value
          else
            raise UnknownConditionInScope.new("#{@operator} is unknown or not implemented.")
          end
        end

        private

        def decode_operator_and_field!
          if match = @operator_and_field.match(/^(?<field>[a-z0-9_-]+)\.(?<operator>.*)$/)
            @field    = match[:field].to_sym
            @operator = match[:operator].to_sym
            check_operator!
          end
          nil
        end

        def check_operator!
          raise UnsupportedOperator.new unless operators.include?(@operator)
        end

        OPERATORS = %i(== eq).freeze
        private_constant :OPERATORS

        def operators
          OPERATORS
        end

      end
    end
  end
end
