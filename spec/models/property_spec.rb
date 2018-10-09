require "rails_helper"

RSpec.describe Property, :type => :model do
  let!(:property) { create(:property) }

  describe '#to_h' do
    let(:expected_output) {
      {
        "house_number"=>"1",
        "street"=>"Thulestraße",
        "city"=>"Berlin",
        "zip_code"=>"13189",
        "lat"=> 0.5253177508e2,
        "lng"=> 0.1338815072e2,
        "price"=>0.124e6
      }
    }

    it 'creates hash out of model' do
      expect(property.to_h).to eql(expected_output)
    end
  end

  describe '#self.find_nearest' do
    context 'when appartment located in radius' do
      let(:params) {
        {
          lng: 13.38815072,
          lat: 52.53177508,
          property_type: 'apartment',
          marketing_type: 'sell'
        }
      }

      it 'finds property' do
        expect(described_class.find_nearest(params)).to include(property)
      end
    end

    context 'when appartment located out of radius' do
      let(:params) {
        {
          lng: 20.38815072,
          lat: 52.53177508,
          property_type: 'apartment',
          marketing_type: 'sell'
        }
      }

      it 'doesnt find property' do
        expect(described_class.find_nearest(params)).not_to include(property)
      end
    end

    context 'when appartment located in radius but has differnt type' do
      let(:params) {
        {
          lng: 13.38815072,
          lat: 52.53177508,
          property_type: 'apartment_maisonette',
          marketing_type: 'sell'
        }
      }

      it 'doesnt find property' do
        expect(described_class.find_nearest(params)).not_to include(property)
      end
    end
  end
end
