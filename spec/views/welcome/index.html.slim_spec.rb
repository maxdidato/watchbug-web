require 'rails_helper'

describe 'welcome/index.html.slim' do

  context 'logged out' do
    before(:each) do
      render
    end
    it 'shows login button' do
      expect(rendered).to have_content('Log in')
    end

    it 'shows sign up button' do
      expect(rendered).to have_content('Sign up')
    end

    it 'doesnt show log out button' do
      expect(rendered).not_to have_content('Log out')
    end

    it 'doesnt show current location button' do
      expect(rendered).not_to have_content('Current location')
    end

    it 'doesnt show protection mode button' do
      expect(rendered).not_to have_content('Protection mode')
    end
  end


  context 'logged in' do
    before(:each) do
      sign_in create(:user)
      render
    end
    it 'doesnt show login button' do
      expect(rendered).not_to have_content('Log in')
    end

    it 'doesnt show sign up button' do
      expect(rendered).not_to have_content('Sign up')
    end

    it 'shows log out button' do
      expect(rendered).to have_content('Log out')
    end

    it 'shows current location button' do
      expect(rendered).to have_content('Current location')
    end

    it 'shows protection mode button' do
      expect(rendered).to have_content('Protection Mode')
    end
  end

end