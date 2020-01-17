require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET #index' do
    let(:call_request) { get :index }

    context 'when user signed in' do
      login_user
      before(:each) { call_request }

      it { expect(response).to have_http_status(200) }
    end

    context 'when user not signed in' do
      before(:each) { call_request }

      it { expect(response).to have_http_status(302) }
    end
  end
end
