require 'rails_helper'

RSpec.feature 'User sign in', :type => :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'successfully from sign in page and sees movie dashboard' do
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text('Movies#index')
  end
end
