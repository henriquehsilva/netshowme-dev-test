require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(302)
    end
  end
end
