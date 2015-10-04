require 'rails_helper'

RSpec.describe ProtectionModesController, type: :controller do

  context '#show' do

    context 'when the user is not authenticated' do

      it 'redirects to the sign_in page' do
        put :update
        assert_redirected_to new_user_session_path
      end

    end

    context 'when the user is authenticated' do
      let(:user) { create(:user) }
      before do
        stub_request(:put, "#{Settings.watchbug_api}/#{user.watchbug_id}/request")
            .with(body: {type: 'protection_mode'}.to_json).to_return(status: status_code)
        sign_in user
      end

      context 'when the api server accepts the request' do
        let(:status_code) { 204 }
        it 'set a flash notice and redirects to root' do
          put :update
          expect(response).to redirect_to(root_path)
          expect(flash[:notice]).to eq('Request sent')
        end

      end
      context 'when the api server doesnt return 201' do
        let(:status_code) { 401 }

        it 'set a flash alert and redirect to root' do
          put :update
          expect(response).to redirect_to(root_path)
          expect(flash[:alert]).to eq('Something went wrong')
        end

      end
    end
  end
end
