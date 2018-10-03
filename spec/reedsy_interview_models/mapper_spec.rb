module ReedsyInterviewModels
  RSpec.describe Mapper do
    let(:adapter) { Adapters::Memory::Adapter.new }

    let(:mapper) do
      Mapper.new(adapter) do
        collection :books do
          entity Book
          repository BookRepository
          attribute :title
        end
      end
    end

    before { mapper }

    it do
      expect(Model[:books]).to be_instance_of(BookRepository)
    end
  end
end
