require 'rails_helper'

RSpec.feature 'Create new movie', type: :feature do
  let(:user) { create(:user) }

  scenario 'successfully create new movie' do
    login_as(user, scope: :user)
    visit new_user_movies_path(user.id)

    fill_in 'name', with: Faker::Lorem.sentence
    fill_in 'url', with: Faker::Internet.url
    click_button 'Criar Vídeo'

    expect(page).to have_text('Netshow.me Dev Test')
  end
end
