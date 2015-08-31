require 'rails_helper'

RSpec.describe GeolocationsController, type: :controller do

  context '#show' do

    context 'when the user is not authenticated' do

      it 'redirects to the sign_in page' do
        get :show
        assert_redirected_to new_user_session_path
      end

    end

    context 'when the user is authenticated' do
      let(:latitude){rand(999)}
      let(:longitude){rand(999)}
      let(:battery){rand(999)}
      before do
        sign_in create(:user)
      end

      it 'gets the geolocation and battery and  set the appropriate instance variables' do
        allow(subject.current_user).to receive(:geolocation).and_return(lat: latitude,long:longitude,battery:battery)
        get :show
        expect(assigns(:link)).to eq("https://maps.google.com/maps?q=#{latitude},#{longitude}&z=16&output=embed")
        expect(assigns(:battery)).to eq(battery)
      end
    end
  end
end
