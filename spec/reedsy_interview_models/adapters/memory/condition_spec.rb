module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Condition do

        subject { described_class.new(operator_and_field, value) }

        let(:field)              { :title }
        let(:operator)           { :eq }
        let(:operator_and_field) { "#{field}.#{operator}"}
        let(:entry)              {{ title: 'Sapiens' }}
        let(:value)              { 'Sapiens' }

        it do
          expect(subject.matches?(entry)).to be_truthy
        end

      end
    end
  end
end
