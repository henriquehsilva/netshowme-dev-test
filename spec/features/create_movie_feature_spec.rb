require 'rails_helper'

RSpec.feature 'User sign in', :type => :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'successfully from sign in page and sees movie dashboard' do
    login_as user, scope: :user
    visit new_user_movies_path(user.id)

    fill_in 'name', with: Faker::Lorem.sentence
    fill_in 'url', with: Faker::Internet.url
    click_button 'Criar Vídeo'

    expect(page).to have_text('Movies#index')
  end
end
