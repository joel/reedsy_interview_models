module ReedsyInterviewModels
  RSpec.describe Entity do
    let(:instance) do
      Class.new do
        include Entity
        attributes :name
      end.new
    end

    it 'should have the right accessor' do
      expect(instance).to be_respond_to(:name)
      expect {
        instance.name = 'Joel AZEMAR'
      }.to change {
        instance.name
      }.from(nil).to('Joel AZEMAR')
    end
  end
end
