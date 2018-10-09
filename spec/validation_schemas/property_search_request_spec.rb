require "rails_helper"

RSpec.describe PropertySearchRequest do
  subject { described_class.new }

  let(:request_parameters) {
    {
      lng: '23.58000',
      lat: '49.398553',
      property_type: 'multi_family_house',
      marketing_type: 'rent'
    }
  }

  it 'is success' do
    expect(subject.call(request_parameters).success?).to be_truthy
  end

  context 'when fields are invalid' do
    {
      lng: '344.900',
      lng: '34.9f0',
      lng: '3.900',
      lng: '900',
      lat: '344.900',
      lat: '34.9f0',
      lat: '3.900',
      lat: '900',
      property_type: 'invalid value',
      marketing_type: 'invalid value'
    }.each do |key, value|
      it 'has errors' do
        request_parameters[key] = value
        expect(subject.call(request_parameters).messages).to have_key(key)
      end
    end
  end
end
