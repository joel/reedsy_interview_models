module ReedsyInterviewModels
  RSpec.describe Model do
    let(:mapper)     { instance_double('ReedsyInterviewModels::Mapper') }
    let(:repository) { instance_double('ReedsyInterviewModels::Repository')}

    before do
      Model.instance_variable_set(:@mapper, mapper)
      allow(mapper).to receive(:[]).with(:films).and_return(repository)
    end

    it do
      expect(Model[:films]).to eql(repository)
    end
  end
end
