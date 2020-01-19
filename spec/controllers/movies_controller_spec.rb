require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    context 'when user signed in' do
      login_user

      it { expect(subject).to have_http_status(200) }
    end

    context 'when user not signed in' do

      it { expect(subject).to have_http_status(302) }
    end
  end

  describe 'POST #create' do
    login_user
    let(:current_user) { User.first }
    let(:user_id) { current_user.id }
    let(:user_movies) { current_user.movies }

    subject { post :create,
      params: {
        use_route: user_movies_path(user_id),
        movie: movie_params,
        user_id: user_id
      }
    }

    context 'with valid attributes' do
      let(:movie_params) {{ name: Faker::Lorem.sentence, url: Faker::Internet.url }}

      it 'should save the new movie in the database' do
        subject
        expect(user_movies.empty?).to be_falsey
      end

      it 'should redirect to the movies#index page' do
        expect(subject).to redirect_to(movies_index_path)
      end
    end

    context 'with invalid attributes' do
      let(:movie_params) {{ name: Faker::Lorem.sentence, url: '' }}

      it 'should not save the new movie in the database' do
        subject
        expect(user_movies.empty?).to be_truthy
      end

      it 'should render movies#new template' do
        expect(subject).to render_template(:new)
      end
    end
  end
end
