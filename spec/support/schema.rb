RSpec.shared_context 'book' do
  let(:collection) do
    ReedsyInterviewModels::Mapping::Collection.new do
      entity Book
      attribute :title
    end
  end
end
