require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context '#onboard' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user
    end

    context 'when the user is not onboarded' do
      before do
        allow(subject.current_user).to receive(:onboarded?).and_return(false)
      end

      it 'shows the onboard page' do

        get :onboard
        assert_template :onboard

      end
    end

    context 'when the user is onboarded' do

      it 'redirects to the root page' do
        get :onboard
        assert_redirected_to root_path
      end
    end

  end


end
