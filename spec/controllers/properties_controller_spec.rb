require "rails_helper"

RSpec.describe PropertiesController, :type => :controller do
  context 'when params are valid' do
    before do
      allow(PropertySearchRequest).to receive_message_chain(:new, :call)
        .and_return(double("PropertySearchRequest", :success? => true))
    end

    context 'and nothing found' do
      before do
        allow(Property).to receive(:find_nearest).and_return([])
      end

      let(:expected_body) { { results: "Nothing found in that area." } }

      it 'returns sorry message' do
        get :search

        expect(response.body).to eq(expected_body.to_json)
      end
    end
  end
end
