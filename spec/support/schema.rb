RSpec.shared_context 'book' do
  let(:adapter) { ReedsyInterviewModels::Adapters::Memory::Adapter.new }
  let(:collection) do
    ReedsyInterviewModels::Mapping::Collection.new(adapter, :books) do
      entity Book
      attribute :title
    end
  end
end
